-- ============================================================================
-- Neovim Native Package Manager (vim.pack)
-- ============================================================================
-- Reference: :h vim.pack, :h vim.pack.add()
--
-- Commands:
--   :packupdate              Check and review plugin updates (confirm with :write)
--   :packupdate ++offline    Inspect installed plugins without network access
--   :packdel <name>          Remove an inactive plugin from disk
--   :packdel ++all           Remove all inactive plugins from disk
--   :checkhealth vim.pack    Verify package manager health
-- ============================================================================

vim.pack.add({
  -- Official collection of LSP server configurations (provides runtime lsp/*.lua)
  "https://github.com/neovim/nvim-lspconfig",
})
