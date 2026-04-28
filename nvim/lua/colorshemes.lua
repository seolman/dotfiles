vim.pack.add({
    { src = "https://github.com/datsfilipe/vesper.nvim" },
})

require("vesper").setup({
    transparent = false,
    italics = {
        comments = false,
        keywords = false,
        functions = false,
        strings = false,
        variables = false,
    },
    overrides = {
        ["Normal"] = { fg = "#ffffff" },
        ["NormalFloat"] = { link = "Normal" },
        ["EndOfBuffer"] = { link = "StatusLine" },
        ["Statement"] = { fg = "#ffc799" },
        ["Keyword"] = { fg = "#ffc799" },
        ["Boolean"] = { fg = "#ffc799" },
        ["Number"] = { fg = "#ffc799" },
        ["Type"] = { link = "Normal" },
        ["@module.builtin.lua"] = { link = "@variables" },
        ["@property"] = { link = "@variable" },
    },
    palette_overrides = {}
})
