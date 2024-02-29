set nohlsearch
set background=dark
syntax on

set foldmethod=syntax   " Use folding for C/C++
set ts=4                " tabstops are 4 (for all code)
set sw=4                " shiftwidth is 4
set expandtab           " expand tabs to spaces
set showmatch           " briefly jump to matching brackets
set showmode            " the mode we're in
filetype on             " enable file type detection
filetype plugin on      " enable file type plugins
filetype indent on      " enable file type indents
"let mapleader = ","     " mapleader \ is not convenient at all

set ea!                 " don't auto resize when splitting or closing splits

" HTML files
autocmd bufnewfile,bufread *.ts,*.tsx set filetype=typescript.tsx
autocmd bufnewfile,bufread *.js set filetype=javascript.jsx
autocmd BufRead *.html,*.css,*.js,*.ts,*.tsx setlocal sw=2 ts=2

call plug#begin()

"Plug 'Erichain/vim-monokai-pro', {'do': ':UpdateRemotePlugins'}
Plug 'ayu-theme/ayu-vim', {'do': ':UpdateRemotePlugins'}

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}


" auto-complete behaves like the one from bash
set wildmenu
set wildmode=list:longest

" Jump to the last opened position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" NERDTree and its config
Plug 'preservim/nerdtree',  { 'do': ':UpdateRemotePlugins' }
Plug 'Xuyuanp/nerdtree-git-plugin',  { 'do': ':UpdateRemotePlugins' }
nnoremap <leader>t :NERDTreeFocus<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

Plug 'vim-airline/vim-airline',  { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline-themes',  { 'do': ':UpdateRemotePlugins' }
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'

Plug 'tpope/vim-surround',  { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive',  { 'do': ':UpdateRemotePlugins' }

Plug 'airblade/vim-gitgutter',  { 'do': ':UpdateRemotePlugins' }

" Jinja2 syntax plugin
Plug 'Glench/Vim-Jinja2-Syntax'

" Code completion and linting with CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
set updatetime=300  " shorter delays, better user experience

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
autocmd User CocStatusChange redrawstatus

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use space + h to show documentation in preview window
nnoremap <silent> <space>h :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys(' h', 'in')
  endif
endfunction

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

autocmd FileType javascript let b:coc_root_patterns = ['package.json', '.eslintrc.js']

"" Give more space for displaying messages.
set cmdheight=2

Plug 'liuchengxu/vista.vim'

let g:vista_executive_for = {'pandoc': 'markdown'}

" JS plugins
Plug 'wokalski/autocomplete-flow',  { 'do': ':UpdateRemotePlugins' }

" Go plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Markdown setup
" See https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Distraction-free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Terminal improvements
Plug 'vimlab/split-term.vim'

" Markdown syntax highlighting
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

Plug 'vim-pandoc/vim-pandoc-syntax',  { 'do': ':UpdateRemotePlugins' }
"augroup pandoc_syntax
"    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
"augroup END

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Comments management
Plug 'scrooloose/nerdcommenter',  { 'do': ':UpdateRemotePlugins' }

" Python completion
Plug 'zchee/deoplete-jedi',  { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim',  { 'do': ':UpdateRemotePlugins' }
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
Plug 'tmhedberg/SimpylFold',  { 'do': ':UpdateRemotePlugins' }

Plug 'machakann/vim-highlightedyank',  { 'do': ':UpdateRemotePlugins' }

Plug 'Yggdroot/indentLine',  { 'do': ':UpdateRemotePlugins' }
let g:indentLine_char = '┊'
let g:indentLine_concealcursor='nc'

" Salt states files editing
Plug 'saltstack/salt-vim',  { 'do': ':UpdateRemotePlugins' }

" Project-located vim config
Plug 'LucHermitte/lh-vim-lib',  { 'do': ':UpdateRemotePlugins' }
Plug 'LucHermitte/local_vimrc',  { 'do': ':UpdateRemotePlugins' }
call plug#end()

set termguicolors
set t_Co=256
let ayucolor="dark"
"colorscheme monokai_pro
colorscheme ayu

" Use system clipboard
set clipboard+=unnamedplus

" Debian dsc file helper
" :call DebFiles('sha1')
function! DebFiles(hash)
    let old_shell = &shell
    set shell=/bin/bash
    exec 'read !for t in `ls *.tar.*`; do echo " $(' . a:hash . 'sum $t | cut -d '' '' -f1) $(du -b $t | cut -f1) $t"; done'
    let &shell = old_shell
endfunction

" Format XML in place
command! FormatXML silent :%!xmllint --format -

" Use rg as grep tool
set grepprg=rg\ -n\ --color=never\ --no-heading

" White list local_vimrc paths
call lh#local_vimrc#munge('whitelist', '/public/src/')
let g:local_vimrc = ['.vimrc']
