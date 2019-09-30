"|\     /|\__   __/(       )(  ____ )(  ____ \
"| )   ( |   ) (   | () () || (    )|| (    \/
"| |   | |   | |   | || || || (____)|| |
"( (   ) )   | |   | |(_)| ||     __)| |
" \ \_/ /    | |   | |   | || (\ (   | |
"  \   /  ___) (___| )   ( || ) \ \__| (____/\
"   \_/   \_______/|/     \||/   \__/(_______/
"
" ______              _______           _______  _        _______    _______  _______  _______  _______
"(  ___ \ |\     /|  (  ____ \|\     /|(  ___  )( (    /|(  ____ \  / ___   )(  __   )(  __   )(  __   )
"| (   ) )( \   / )  | (    \/| )   ( || (   ) ||  \  ( || (    \/  \/   )  || (  )  || (  )  || (  )  |
"| (__/ /  \ (_) /   | |      | (___) || (___) ||   \ | || |            /   )| | /   || | /   || | /   |
"|  __ (    \   /    | |      |  ___  ||  ___  || (\ \) || | ____     _/   / | (/ /) || (/ /) || (/ /) |
"| (  \ \    ) (     | |      | (   ) || (   ) || | \   || | \_  )   /   _/  |   / | ||   / | ||   / | |
"| )___) )   | |     | (____/\| )   ( || )   ( || )  \  || (___) |  (   (__/\|  (__) ||  (__) ||  (__) |
"|/ \___/    \_/     (_______/|/     \||/     \||/    )_)(_______)  \_______/(_______)(_______)(_______)

set nocompatible              " required
filetype off                  " required

call plug#begin('~/.vim/plugged')

        Plug 'scrooloose/nerdtree'
        Plug 'Yggdroot/indentLine'
        Plug 'scrooloose/nerdcommenter'
        Plug 'vim-python/python-syntax'
        Plug 'junegunn/goyo.vim'
        "Plug 'ervandew/supertab'
        Plug 'jiangmiao/auto-pairs'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        Plug 'arcticicestudio/nord-vim'
        Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
        Plug 'chuling/vim_equinusocio_material'
        Plug 'rakr/vim-one'
        Plug 'morhetz/gruvbox'

call plug#end()

set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
set nowrap                 " nobreak for a line of code
set number
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         "  indents by 4 spaces.
set shiftround             "  indents to next multiple of 'shiftwidth'.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.
"set ruler
set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.
set mouse=a
set incsearch              " Highlight while searching with / or ?.
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.
set cursorline             " Find the current line quickly.



    " leader key related
            let mapleader="\<Space>"
            :command WQ wq
            :command Wq wq
            :command W w
            :command Q q

            map <leader>y "+y
            map <leader>w :w<CR>

"Remove trailing space before saving
autocmd BufWritePre * %s/\s\+$//e

" Plugin settings
"--------------------Nerd-Tree----------------
" show number
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeWinSize=25
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" quit nerd tree when quiting the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"open file at the la
"t position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" toggle nerdtree
nmap <leader>nn :NERDTreeToggle<CR>

"show-indent-line
let g:indentLine_enabled = 1
let g:indentLine_char='¦'

"nerd-commenter
nmap <leader>/  <leader>ci<CR>

" Goyo
nmap <leader>o :Goyo<CR>
" colod
" True color terminal support
set t_Co=256

        if (empty($TMUX))
            if (has("nvim"))
            let $NVIM_TUI_ENABLE_TRUE_COLOR=1
            endif
            if (has("termguicolors"))
                set termguicolors
            endif
        endif

"colorscheme gruvbox
"colorscheme one
"colorscheme challenger_deep
colorscheme equinusocio_material
"colorscheme nord
"colorscheme dracula
set background=dark
"set background=light

" if you prefer the default one, comment out this line
let g:equinusocio_material_style='darker'
" comment out this line to make vertsplit invisible
let g:equinusocio_material_vertsplit='visible'
" this theme has a buildin lightline theme, you can turn it on
let g:lightline = {
    \ 'colorscheme': 'equinusocio_material',
    \ }


"Python Syntax Plus
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

"GUI setting
set guifont=Input\ Mono:h16
set linespace=6
" turn off the cursor blink
set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" turn of the toolbar and meau bar
set guioptions-=m
set guioptions-=T"

" coc Autocompletion
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
                :endif
            :endfunction


