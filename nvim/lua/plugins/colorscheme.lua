return {
    "ayu-theme/ayu-vim",

    -- tab line
    "akinsho/bufferline.nvim",

    -- bottom line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        "luukvbaal/statuscol.nvim",
        config = function()
            local builtin = require("statuscol.builtin")
            require("statuscol").setup({
                segments = {
                    {
                        text = { builtin.foldfunc },
                        click = "v:lua.ScFa",
                    },
                },
            })
        end,
    }
}
