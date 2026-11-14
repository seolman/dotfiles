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
-- ============================================================================

-- ============================================================================
-- 1. Global / Wildcard Server Configuration
-- ============================================================================
vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- ============================================================================
-- 2. Per-Server Overrides
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
-- 3. Enable Language Servers
-- ============================================================================
-- Servers listed below will automatically attach when their executable is
-- installed in PATH and a matching filetype / workspace root is opened.
vim.lsp.enable({
  "lua_ls",        -- Lua (lua-language-server)
  "ts_ls",         -- TypeScript / JavaScript (typescript-language-server)
  "pyright",       -- Python (pyright)
  "basedpyright",  -- Python alternative (basedpyright)
  "clangd",        -- C / C++ (clangd)
  "rust_analyzer", -- Rust (rust-analyzer)
  "gopls",         -- Go (gopls)
})

-- ============================================================================
-- 4. Native LSP Features on Attach (:h LspAttach)
-- ============================================================================
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("native_lsp_attach", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    -- Enable native LSP auto-completion (:h vim.lsp.completion)
    -- Use <C-n>/<C-p> to cycle items and <C-y> to confirm selection.
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

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
