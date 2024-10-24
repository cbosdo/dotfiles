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
            require("go").setup({
                trouble = true,
            })
            -- Don't exclude defaults from GoLint
            vim.cmd([[command! GoLint :setl makeprg=golangci-lint\ run\ --print-issued-lines=false\ --out-format=line-number | :GoMake]])
        end,
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
    "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    }
}
