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
  expandtab = true,
  shiftwidth = 2,
  signcolumn = "yes:2",
  splitright = true,
  splitbelow = true,
  tabstop = 2,
  termguicolors = true,
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

-- local function clear_bg(name)
--   vim.print(vim.api.nvim_get_hl(0, { name = name }))
--   vim.api.nvim_set_hl(0, name, { bg = "NONE" })
--   vim.print(vim.api.nvim_get_hl(0, { name = name }))
-- end
--
-- clear_bg("Normal")
--
-- vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { link = "NormalFloat" })

local hi_opts = {
  Normal = { bg = "NONE" },
  NormalFloat = { link = "Normal" },
  FloatBorder = { link = "NormalFloat" },
}

for k, v in pairs(hi_opts) do
  local prev_opt = vim.api.nvim_get_hl(0, { name = k })
  local current_opt = vim.tbl_extend("force", prev_opt, v)
  vim.api.nvim_set_hl(0, k, current_opt)
end
