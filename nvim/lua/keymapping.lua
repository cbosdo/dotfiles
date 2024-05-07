local wk = require("which-key")

wk.register({
    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "File" },
        h = { "<cmd>Telescope oldfiles<cr>", "Recent file"},
        g = { "<cmd>Telescope live_grep<cr>", "Grep"},
        b = { "<cmd>Telescope buffers<cr>", "Buffers"},
        h = { "<cmd>Telescope help_tags<cr>", "Help tags"},
        s = { "<cmd>Telescope symbols<cr>", "Emojis and symbols"},
        r = { "<cmd>Telescope lsp_references<cr>", "Symbol references"},
    },
    t = {
        name = "Tabs and panes",
        f = { "<cmd>NvimTreeFindFileToggle<cr>", "Toggle files list" },
        o = { "<cmd>Outline<cr>", "Toggle Outline" },
        n = { "<cmd>tabnext<cr>", "Next tab" },
        p = { "<cmd>tabprev<cr>", "Previous tab" },
        u = { "<cmd>UndotreeToggle<cr>", "Undo history" },
    },
}, { prefix = "<leader>" })
