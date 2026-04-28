vim.lsp.enable({
    "clangd",
    "lua_ls",
    "gopls",
    "marksman",
    "markdown_oxide",
    "terraformls",
    "jsonls",
    "ts_ls",
    "yamlls",
    "tinymist"
})

vim.keymap.set({ "n" }, "K", function()
    vim.lsp.buf.hover({
        width = 80,
    })
end)
vim.keymap.set({ "n" }, "gd", function()
    vim.lsp.buf.definition()
end, { desc = "Go to definition" })
vim.keymap.set({ "n" }, "gD", function()
    vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })

vim.diagnostic.config({
    capabilities = {},
    virtual_lines = {
        severity = vim.diagnostic.severity.ERROR,
        current_line = true
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "●",
            [vim.diagnostic.severity.WARN] = "●",
            [vim.diagnostic.severity.INFO] = "●",
            [vim.diagnostic.severity.HINT] = "●",
        },
    }
})

vim.lsp.semantic_tokens.enable(false)

vim.api.nvim_create_user_command("InlayHintToggle", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { nargs = 0 })
