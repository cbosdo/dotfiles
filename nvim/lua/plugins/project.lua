return {
    {
        "klen/nvim-config-local",
        config = function()
            require('config-local').setup {
                -- Config file patterns to load (lua supported)
                config_files = { ".nvim.lua", ".vimrc" ,".nvimrc", ".exrc" },

                -- Where the plugin keeps files data
                hashfile = vim.fn.stdpath("data") .. "/config-local",

                autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
                lookup_parents = true,     -- Lookup config files in parent directories
            }
        end
    },
}
