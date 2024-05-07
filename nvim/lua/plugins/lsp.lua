return {
    { "williamboman/mason.nvim", lazy = false },
    { "williamboman/mason-lspconfig.nvim", lazy = false },
    "neovim/nvim-lspconfig",
    {
        "hedyhli/outline.nvim",
        config = function()
            require("outline").setup {
                -- Your setup opts here (leave empty to use defaults)
            }
        end,
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
        },
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {
            'kevinhwang91/promise-async',
        },
    },
    {
        "ray-x/go.nvim",
        dependencies = {    -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    }
}
