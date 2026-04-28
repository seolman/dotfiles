vim.keymap.set({ "n", "x" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "x" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "x" }, "c", '"_c')
vim.keymap.set({ "n", "x" }, "G", "Gzz")

vim.keymap.set({ "n" }, "n", "nzz")
vim.keymap.set({ "n" }, "N", "Nzz")

vim.keymap.set({ "v" }, "<", "<gv")
vim.keymap.set({ "v" }, ">", ">gv")

vim.keymap.set({ "n", "x" }, "gh", "0", { desc = "Go to start of line" })
vim.keymap.set({ "n", "x" }, "gs", "^", { desc = "Go to first blank of line" })
vim.keymap.set({ "n" }, "gl", "$", { desc = "Go to end of line" })
vim.keymap.set({ "x" }, "gl", "$h", { desc = "Go to end of line" })

vim.keymap.set({ "n" }, "<C-w>e", ":enew<CR>", { desc = "Open new buffer" })

vim.keymap.set({ "n" }, "<leader>e", ":Ex<CR>", { desc = "Open Netrw" })
