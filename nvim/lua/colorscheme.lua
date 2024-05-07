vim.cmd 'set termguicolors'
vim.cmd 'colorscheme ayu'

-- lua line setup
require('lualine').setup()

-- tab line configuration
require("bufferline").setup {
    options = {
        mode = 'tabs',
        diagnostics = 'nvim_lsp',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                test_align = "left",
                highlight = "Directory",
                separator = true,
            }
        },
        separator_style = "slant",
    },
}

-- Indent-blank line colored indents
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { indent = { highlight = highlight } }
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash",
        "fish",
        "lua",
        "markdown",
        "vim",
        "regex",
        "markdown_inline",
        "go",
        "gomod",
        "gosum",
        "python",
        "c",
        "json",
        "xml",
        "yaml",
    },

    -- Install parsers synchronously
    -- (only applied to
    -- `ensure_installed`)
    sync_install = false,

    -- Automatically install missing
    -- parsers when entering buffer
    -- Recommendation: set to false
    -- if you don't have `tree-sitter`
    -- CLI installed locally
    auto_install = false,
}

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
