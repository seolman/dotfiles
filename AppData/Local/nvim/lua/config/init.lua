-- Base configuration module
-- Load globals (mapleader, netrw, etc.) first before options, keymaps, or plugins
require("config.globals")
require("config.options")
require("config.keymaps")
require("config.ui")
require("plugins")
require("config.lsp")
