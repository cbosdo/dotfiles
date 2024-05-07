local indent = 4

vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

vim.opt.expandtab = true
vim.opt.shiftwidth = indent
vim.opt.tabstop = indent
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.showmode = true
vim.cmd('set nohlsearch')

vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Use the system clipboard
vim.opt.clipboard:append { 'unnamedplus' }

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Jump to the last opened position
vim.api.nvim_create_autocmd(
    {'BufReadPost'},{
    pattern = {'*'},
    callback = function()
        local ft = vim.opt_local.filetype:get()
        -- don't apply to git messages
        if (ft:match('commit') or ft:match('rebase')) then
            return
        end
        -- get position of last saved edit
        local markpos = vim.api.nvim_buf_get_mark(0,'"')
        local line = markpos[1]
        local col = markpos[2]
        -- if in range, go there
        if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
            vim.api.nvim_win_set_cursor(0,{line,col})
        end
    end
})
