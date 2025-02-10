local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		print("Failed to clone lazy.nvim:\n" .. out)
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local options = {
	number = true,
	relativenumber = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

require("lazy").setup({
	spec = { import = "plugins" },
	install = { colorscheme = { "default" } },
	ui = {
		size = { width = 0.9, height = 0.8 },
		border = "single",
		backdrop = 100,
	},
})
