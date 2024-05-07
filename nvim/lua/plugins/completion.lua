return {
    -- cmp
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",

    -- snippets
    {
        "SirVer/ultisnips",
        dependencies = {
            'honza/vim-snippets',
        },
    },
    "quangnguyen30192/cmp-nvim-ultisnips",
    "rafamadriz/friendly-snippets", -- snippets repo

    -- neodev
    "folke/neodev.nvim",

    -- auto pairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
}
