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
        "
        Plug 'vim-scripts/vim-auto-save'
        Plug 'octol/vim-cpp-enhanced-highlight'
        Plug 'wakatime/vim-wakatime'
        Plug 'jiangmiao/auto-pairs'
        "Plug 'ycm-core/YouCompleteMe'
        Plug 'zxqfl/tabnine-vim'
        "Plug 'neoclide/coc.nvim', {'branch': 'release'}

        Plug 'arcticicestudio/nord-vim'
        Plug 'chuling/vim_equinusocio_material'
        Plug 'rakr/vim-one'
        Plug 'morhetz/gruvbox'
        Plug 'liuchengxu/space-vim-theme'
call plug#end()

set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting
syntax enable

set nowrap                 " nobreak for a line of code
set nu

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
"set cursorline             " Find the current line quickly.



    " leader key related
            let mapleader="\<Space>"
            :command WQ wq
            :command Wq wq
            :command W w
            :command Q q
map <leader>y "+y 
map <leader>s :w<CR>
imap jk <ESC>
" Remove trailing space before saving
        "autocmd BufWritePre * %s/\s\+$//e

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

" Auto Save
let g:auto_save = 1
let g:auto_save_slient = 1

"
"
" True color terminal support
set t_Co=256
set termguicolors
if (empty($TMUX))
    if (has("termguicolors"))
        set termguicolors
    endif
endif

"colorscheme gruvbox
"olorscheme one
"colorscheme challenger_deep
"colorscheme equinusocio_material
colorscheme nord
"colorscheme monokai
"colorscheme kuroi
"colorscheme dracula
"colorscheme space_vim_theme
"set background=light
set background=dark


"Python Syntax Plus
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

"GUI setting
        set guifont=Iosevka\ Slab:h18
        set linespace=6
        "turn off the cursor blink
        set gcr=a:block-blinkon0
        set guioptions-=l
        set guioptions-=L
        set guioptions-=r
        set guioptions-=R
        "turn of the toolbar and meau bar
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
                elseif &filetype == 'php'
                    exec '!php %'
                elseif &filetype == 'sh'
                    exec '!./%'
                :endif
            :endfunction

" change for the eamcs git test
