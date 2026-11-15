-- ============================================================================
-- Neovim General Keymaps
-- ============================================================================
-- Loaded after config.globals (mapleader) and config.options.
-- ============================================================================

local map = vim.keymap.set

-- Keep cursor centered when scrolling or jumping between search results
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll half-page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll half-page up and center" })
map("n", "<C-f>", "<C-f>zz", { desc = "Scroll page down and center" })
map("n", "<C-b>", "<C-b>zz", { desc = "Scroll page up and center" })

map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })
map("n", "*", "*zzzv", { desc = "Search word forward and center" })
map("n", "#", "#zzzv", { desc = "Search word backward and center" })
map("n", "G", "Gzz", { desc = "Go to last line and center" })
