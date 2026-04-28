local gruvbox_palette = {
    base00 = "#282828", -- dark0 (Background)
    base01 = "#3c3836", -- dark1 (Lighter Background)
    base02 = "#504945", -- dark2 (Selection Background)
    base03 = "#665c54", -- dark3 (Comments, Secondary Content)
    base04 = "#bdae93", -- light3 (Dark Foreground)
    base05 = "#d5c4a1", -- light2 (Default Foreground)
    base06 = "#ebdbb2", -- light1 (Light Foreground)
    base07 = "#fbf1c7", -- light0 (Lightest Foreground)
    base08 = "#fb4934", -- bright_red (Variables, XML Tags)
    base09 = "#fe8019", -- bright_orange (Integers, Boolean)
    base0A = "#fabd2f", -- bright_yellow (Classes, Storage)
    base0B = "#b8bb26", -- bright_green (Strings, Inherited Class)
    base0C = '#8ec07c', -- bright_aqua (Support, Regular Expressions)
    base0D = "#83a598", -- bright_blue (Functions, Methods)
    base0E = "#d3869b", -- bright_purple (Keywords, Attributes)
    base0F = "#d65d0e", -- neutral_orange (Deprecated, Opening/Closing Embedded Tags)
}

require("mini.base16").setup({
    palette = gruvbox_palette,
    plugins = {
        default = false,
        -- ["nvim-mini/mini.nvim"] = true,
    },
})

vim.api.nvim_set_hl(0, "Normal", { fg = "#d5c4a1", bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { fg = "#d5c4a1", bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#665c54", bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNrAbove", { link = "LineNr" })
vim.api.nvim_set_hl(0, "LineNrBelow", { link = "LineNr" })
vim.api.nvim_set_hl(0, "SignColumn", { link = "LineNr" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#bdae93", bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#665c54", bg = "NONE" })
vim.api.nvim_set_hl(0, "PMenu", { link = "Normal" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { link = "DiagnosticHint" })
vim.api.nvim_set_hl(0, "DiagnosticFloatingOk", { link = "DiagnosticOk" })
vim.api.nvim_set_hl(0, "MiniClueTitle", { link = "Title" })
vim.api.nvim_set_hl(0, "MiniPickPromptCaret", { link = "MiniPickNormal" })
vim.api.nvim_set_hl(0, "MiniPickPromptPrefix", { link = "MiniPickNormal" })
vim.api.nvim_set_hl(0, "MiniPickBorderBusy", { fg = "#d3869b", bg = "NONE" })
vim.api.nvim_set_hl(0, "MiniPickBorderText", { fg = "#83a598", bg = "NONE" })

vim.g.colors_name = "gruvbox"
