set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
    " Core completion extension 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Edit related
    Plug 'scrooloose/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-python/python-syntax'
    Plug 'vim-scripts/vim-auto-save'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'MattesGroeger/vim-bookmarks'

    " Special Script Grammar enhancement
    Plug 'cespare/vim-toml'
    Plug 'dag/vim-fish'
    " Color Scheme
    Plug 'liuchengxu/space-vim-theme'
    Plug 'crusoexia/vim-monokai'

    Plug 'wakatime/vim-wakatime'
call plug#end()

" set up the python version Vim is gonna use
let g:python3_host_prog = "/usr/local/bin/python3"

set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting
syntax enable

set nowrap                 " nobreak for a line of code
"set nu

set backspace=indent,eol,start
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set tabstop=4              " Tab key indents by 4 spaces
set shiftwidth  =4         "  indents by 4 spaces.
set shiftround             "  indents to next multiple of 'shiftwidth'.
set display     =lastline  " Show as much as possible of the last line.
set ruler
set showmode               " Show current mode in command-line.
set laststatus  =2         " Always show statusline.
set showcmd                " Show already typed keys when more are expected.
set mouse=ac
set incsearch              " Highlight while searching with / or ?.
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.


" leader key related
let mapleader="\<Space>"
:command WQ wq
:command Wq wq
:command W w
:command Q q

" copy text to clipboard
map <leader>y "+y 
map <leader>s :w<CR>
imap jk <ESC>

" modifiy the insert mode behavior
inoremap <C-F> <Right>
inoremap <C-B> <Left>

"open file at the lat position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Plugin settings
"--------------------Nerd-Tree----------------
" show number
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeWinSize=20
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" quit nerd tree when quiting the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" toggle nerdtree
nmap <leader>nn :NERDTreeToggle<CR>

"show-indent-line
let g:indentLine_enabled = 1
let g:indentLine_char='¦'

" Goyo
nmap <leader>o :Goyo<CR>

" Fold
set foldmethod=indent "syntax highlighting items specify folds
set foldlevelstart=99 "start file with all folds opened

" Auto Save
let g:auto_save = 1
let g:auto_save_slient = 1

" True color terminal support
set t_Co=256
set termguicolors

"colorscheme one set background=dark
colorscheme monokai
"colorscheme space_vim_theme

"Python Syntax Plus
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

" coc Autocompletion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Vim Bookmark
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '⚑'
let g:bookmark_highlight_lines = 1

" Quick Run
map <leader>r :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec '!gcc % -o %<'
        exec '!time ./%<'
        exec '!rm %<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
        exec '!rm %'
    elseif &filetype == 'python'
        exec '!python3 %'
    elseif &filetype == 'tex'
        exec '!xelatex %'
    elseif &filetype == 'php'
        exec '!php %'
    elseif &filetype == 'sh'
        exec '!./%'
    elseif &filetype == 'javascript'
        exec '!node %'
    elseif &filetype == 'typescript'
        exec '!tsc %'
    :endif
:endfunction
