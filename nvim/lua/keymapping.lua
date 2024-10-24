local wk = require("which-key")

wk.add({
    { "<leader>f", group = "Find" },
    { "<leader>fG", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>fH", "<cmd>Telescope oldfiles<cr>", desc = "Recent file" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "File" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "Symbol references" },
    { "<leader>fs", "<cmd>Telescope symbols<cr>", desc = "Emojis and symbols" },
    { "<leader>t", group = "Tabs and panes" },
    { "<leader>td", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics" },
    { "<leader>tf", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle files list" },
    { "<leader>to", "<cmd>Outline<cr>", desc = "Toggle Outline" },
    { "<leader>tu", "<cmd>UndotreeToggle<cr>", desc = "Undo history" },
})
