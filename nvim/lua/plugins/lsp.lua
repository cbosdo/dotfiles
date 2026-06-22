return {
    { "williamboman/mason.nvim", lazy = false },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    { "folke/neoconf.nvim" },
    "neovim/nvim-lspconfig",
    {
        "hedyhli/outline.nvim",
        config = function()
            require("outline").setup {
                -- Your setup opts here (leave empty to use defaults)
                providers = {
                    priority = { 'lsp', 'coc', 'markdown', 'norg', 'asciidoc' },
                },
            }
        end,
        event = "VeryLazy",
        dependencies = {
            'msr1k/outline-asciidoc-provider.nvim'
        },
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
            vim.cmd([[command! GoLint :setl makeprg=golangci-lint\ run\ | :GoMake]])
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
    },
    { "nvimtools/none-ls.nvim" },
    {
        'nvim-java/nvim-java',
        config = function()
            require('java').setup()
            vim.lsp.enable('jdtls')
        end,
    }
}
