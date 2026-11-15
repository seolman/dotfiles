-- ============================================================================
-- Neovim Native LSP Configuration (Neovim 0.11+ / 0.13)
-- ============================================================================
-- Reference: :h lsp, :h lsp-defaults, :h vim.lsp.config(), :h vim.lsp.enable()
--
-- ============================================================================
-- Built-in Default Keymaps (:h lsp-defaults, :h diagnostic-defaults)
-- ============================================================================
-- Neovim provides the following keymaps out of the box (no custom mapping needed):
--
-- [Global LSP Keymaps]
--   grn          (Normal)          vim.lsp.buf.rename()           Rename symbol
--   gra          (Normal, Visual)  vim.lsp.buf.code_action()      Code actions
--   grr          (Normal)          vim.lsp.buf.references()       List references in quickfix
--   gri          (Normal)          vim.lsp.buf.implementation()   List implementations
--   grt          (Normal)          vim.lsp.buf.type_definition()  Jump to type definition
--   grx          (Normal)          vim.lsp.codelens.run()         Run CodeLens on current line
--   gO           (Normal)          vim.lsp.buf.document_symbol()  List document symbols in loclist
--   <C-s>        (Insert, Select)  vim.lsp.buf.signature_help()   Show signature help
--   an / in      (Visual, Op-pend) vim.lsp.buf.selection_range()  Expand/shrink selection (fallback when treesitter is inactive)
--
-- [Buffer-local LSP Defaults (set automatically on LspAttach)]
--   K            (Normal)          vim.lsp.buf.hover()            Hover documentation
--   <C-]>        (Normal)          Jump to definition via 'tagfunc' (vim.lsp.tagfunc)
--   <C-w>]       (Normal)          Split window and jump to definition via 'tagfunc'
--   gq           (Normal, Visual)  Format lines via 'formatexpr' (vim.lsp.formatexpr)
--   <C-x><C-o>   (Insert)          Trigger LSP completion via 'omnifunc' (vim.lsp.omnifunc)
--   gx           (Normal)          Open document links (textDocument/documentLink)
--
-- [Built-in Diagnostic Keymaps (:h diagnostic-defaults)]
--   ]d / [d      (Normal)          Jump to next / previous diagnostic
--   ]D / [D      (Normal)          Jump to last / first diagnostic in buffer
--   <C-w>d       (Normal)          Show diagnostics under cursor in a floating window
--
-- [Built-in LSP Commands (:h lsp-commands)]
--   :lsp enable [name]             Enable LSP config
--   :lsp disable [name]            Disable LSP config
--   :lsp restart [name]            Restart active LSP client(s)
--   :lsp stop [name]               Stop active LSP client(s)
--   :checkhealth vim.lsp           Inspect active LSP clients and configurations
--   :Mason                         Open Mason package manager UI
-- ============================================================================

-- ============================================================================
-- 1. Hybrid Mason Setup (System-First + Mason Fallback)
-- ============================================================================
-- `PATH = "append"` places Mason's bin directory at the END of PATH.
-- If a language server is already installed on the system (e.g., via rustup,
-- winget, scoop, brew, apt), Neovim uses the system binary first; otherwise
-- it falls back to the Mason-managed binary.
require("mason").setup({
  PATH = "append",
})

-- Server map: { lsp_config_name, executable_name, mason_package_name }
local servers = {
  { config = "lua_ls",        bin = "lua-language-server",        mason = "lua-language-server" },
  { config = "ts_ls",         bin = "typescript-language-server", mason = "typescript-language-server" },
  { config = "basedpyright",  bin = "basedpyright-langserver",    mason = "basedpyright" },
  { config = "clangd",        bin = "clangd",                     mason = "clangd" },
  { config = "rust_analyzer", bin = "rust-analyzer",              mason = "rust-analyzer" },
  { config = "gopls",         bin = "gopls",                      mason = "gopls" },
}

-- Auto-install missing servers via Mason only when not present in system PATH
local mr = require("mason-registry")
mr.refresh(function()
  for _, srv in ipairs(servers) do
    if vim.fn.executable(srv.bin) == 0 then
      local ok, pkg = pcall(mr.get_package, srv.mason)
      if ok and not pkg:is_installed() and not pkg:is_installing() then
        pkg:install()
      end
    end
  end
end)

-- ============================================================================
-- 2. Global / Wildcard Server Configuration
-- ============================================================================
vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- ============================================================================
-- 3. Per-Server Overrides
-- ============================================================================
-- Configure Lua Language Server to recognize the `vim` global and Neovim runtime
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    },
  },
})

-- ============================================================================
-- 4. Enable Language Servers
-- ============================================================================
local enabled_configs = {}
for _, srv in ipairs(servers) do
  table.insert(enabled_configs, srv.config)
end
vim.lsp.enable(enabled_configs)

-- ============================================================================
-- 5. Native LSP Features on Attach (:h LspAttach)
-- ============================================================================
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("native_lsp_attach", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    -- Go to definition / declaration (Neovim only maps <C-]> via tagfunc by default)
    if client:supports_method("textDocument/definition") then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "LSP: Go to definition" })
    end
    if client:supports_method("textDocument/declaration") then
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "LSP: Go to declaration" })
    end

    -- Enable native LSP auto-completion (:h vim.lsp.completion)
    -- Use <C-n>/<C-p> to cycle items and <C-y> to confirm selection.
    -- if client:supports_method("textDocument/completion") then
    --   vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    -- end

    -- Enable native Inlay Hints if supported by the server (:h vim.lsp.inlay_hint)
    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

      -- Toggle Inlay Hints for the current buffer with `grh` (matches native `gr*` prefix)
      vim.keymap.set("n", "grh", function()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
        vim.lsp.inlay_hint.enable(not enabled, { bufnr = ev.buf })
      end, { buffer = ev.buf, desc = "LSP: Toggle inlay hints" })
    end
  end,
})
