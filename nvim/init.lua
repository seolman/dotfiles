require("options")
require("keymaps")
require("lsp")
require("colorshemes")


vim.cmd("colorscheme vesper")


vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
})


-- nvim-treesitter
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})


-- mini.nvim
require("mini.completion").setup({
    window = {
        info = { height = 25, width = 80, border = nil },
        signature = { height = 25, width = 80, border = nil },
    },
    lsp_completion = {
        source_func = "omnifunc",
    },
})
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.bo[args.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
    end,
})


require("mini.pairs").setup({})


require("mini.surround").setup({
    mappings = {
        find = "",
        find_left = "",
        highlight = "",
        suffix_last = "",
        suffix_next = "",
    },
    silent = true
})


local mini_clue = require("mini.clue")
mini_clue.setup({
    triggers = {
        { mode = { "n", "x" }, keys = "<Leader>" },
        { mode = "n",          keys = "[" },
        { mode = "n",          keys = "]" },
        { mode = "i",          keys = "<C-x>" },
        { mode = { "n", "x" }, keys = "g" },
        { mode = { "n", "x" }, keys = "'" },
        { mode = { "n", "x" }, keys = "`" },
        { mode = { "n", "x" }, keys = '"' },
        { mode = { "i", "c" }, keys = "<C-r>" },
        { mode = "n",          keys = "<C-w>" },
        { mode = { "n", "x" }, keys = "z" },
    },
    clues = {
        {
            mode = {},
            keys = {},
            desc = "",
            postkeys = nil
        },
        mini_clue.gen_clues.square_brackets(),
        mini_clue.gen_clues.builtin_completion(),
        mini_clue.gen_clues.g(),
        mini_clue.gen_clues.marks(),
        mini_clue.gen_clues.registers(),
        mini_clue.gen_clues.windows(),
        mini_clue.gen_clues.z(),
    },
    window = {
        config = { width = 50 },
        delay = 300,
    },
})


require("mini.git").setup()
vim.keymap.set({ "n" }, "<leader>gs", ":Git status -sb<CR>", { desc = "Git status" })
vim.keymap.set({ "n" }, "<leader>gA", ":Git add %<CR>", { desc = "Git add current file" })
vim.keymap.set({ "n" }, "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })


local jump2d = require("mini.jump2d")
jump2d.setup({
    view = {
        n_steps_ahead = 1,
    },
    spotter = jump2d.builtin_opts.word_start.spotter,
    allowed_lines = {
        blank = false,
        fold = false,
    },
    mappings = {
        start_jumping = "gw",
    },
    silent = true,
})
vim.api.nvim_set_hl(0, "MiniJump2dSpot", { bold = true, italic = true })
vim.api.nvim_set_hl(0, "MiniJump2dSpotAhead", { link = "MiniJump2dSpot" })


require("mini.diff").setup({
    view = {
        style = "sign",
        signs = { add = "▍", change = "▍", delete = "▍" },
    },
    mappings = {
        apply = "<leader>ga",
        reset = "<leader>gr",
        textobject = "",
        goto_prev = "[h",
        goto_next = "]h",
        goto_first = "",
        goto_last = "",
    },
})

require("mini.extra").setup()

require("mini.pick").setup({
    mappings = {
        choose            = "<CR>",
        choose_in_tabpage = '',
        choose_marked     = "<M-CR>",
        mark              = "<C-x>",
        mark_all          = "<C-a>",
        paste             = "<C-r>",
        refine            = "<C-Space>",
        refine_marked     = "<M-Space>",
        toggle_info       = "<Tab>",
        toggle_preview    = "<C-T>",
    },
    window = {
        config = function()
            local height = math.floor(0.5 * vim.o.lines)
            local width = math.floor(0.5 * vim.o.columns)
            return {
                anchor = "NW",
                height = height,
                width = width,
                row = math.floor(0.5 * (vim.o.lines - height)),

                col = math.floor(0.5 * (vim.o.columns - width)),
            }
        end,
        prompt_caret = '█',
        prompt_prefix = '─ ',
    },
})
vim.keymap.set({ "n" }, "<leader>f", ":Pick files<CR>", { desc = "Open file picker" })
vim.keymap.set({ "n" }, "<leader>b", ":Pick buffers<CR>", { desc = "Open buffer picker" })
vim.keymap.set({ "n" }, "<leader>d", ":Pick diagnostic<CR>", { desc = "Open diagnostic picker" })
vim.keymap.set({ "n" }, "<leader>/", ":Pick grep_live<CR>", { desc = "Open grep picker" })
vim.keymap.set({ "n" }, "<leader>'", ":Pick resume<CR>", { desc = "Open resume picker" })
vim.keymap.set({ "n" }, "<leader>?", ":Pick help<CR>", { desc = "Open help picker" })


local mini_sessions = require("mini.sessions")
mini_sessions.setup({
    directory = vim.fn.stdpath("data") .. "/session",
    file = ""
})
vim.keymap.set({ "n" }, "<leader>q", function()
    mini_sessions.write(vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. ".vim")
end, { desc = "Write session" })


local notifiy = require("mini.notify")
notifiy.setup({
    content = {
        format = function(notif) return notif.msg end,
    },
    lsp_progress = {
        enable = false,
    },
    window = {
        config = {},
        winblend = 0,
    },
})
vim.notify = notifiy.make_notify({
    ERROR = { duration = 1500 },
    WARN = { duration = 1000 },
    INFO = { duration = 500 },
})


require("mini.starter").setup({
    header = [[
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠸⣿⣿⠁⢻⣿⣿⣿⡿⢹⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠹⡿⠀⠀⠙⠋⠛⠀⢸⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠃⠀⠀⢠⡄⢠⡄⠸⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠐⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⢀⣴⣿⡄⠀⠀⢤⣤⣾⣷⣄⠀⠀⢻⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⢸⣿⣿⡇⠀⠀⠸⣿⣿⣿⣿⣧⡀⠀⠉⢻⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣴⣿⣿⣿⣆⣀⣠⣴⣿⣿⣿⣿⣿⣧⣤⣠⣼⣿⣿⣿
⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠙⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛
    ]],
    footer = "",
    silent = true,
})
