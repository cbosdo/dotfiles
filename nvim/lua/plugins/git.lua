return {
    "lewis6991/gitsigns.nvim", -- git margin signs
    "tpope/vim-fugitive", -- Mostly for git blames, check neogit once they have it
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
          "nvim-lua/plenary.nvim",
          "sindrets/diffview.nvim",

            "nvim-telescope/telescope.nvim",
        },
        cmd = "Neogit",
        keys = {
           { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    }
}
