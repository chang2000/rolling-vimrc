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
        Plug 'rakr/vim-one'
        Plug 'morhetz/gruvbox'
        Plug 'chuling/vim_equinusocio_material'
        Plug 'junegunn/goyo.vim'
        "Plug 'ervandew/supertab'
        Plug 'jiangmiao/auto-pairs'
        Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
        Plug 'neoclide/coc.nvim', {'branch': 'release'}


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
"set synmaxcol   =200       " Only highlight the first 200 columns.

    " leader key related
            let mapleader="\<Space>"
            :command WQ wq
            :command Wq wq
            :command W w
            :command Q q
            vmap <leader>y "+y
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
"open file at the last position
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

" colod
" True color terminal support
        if (empty($TMUX))
        if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        if (has("termguicolors"))
            set termguicolors
        endif
        endif

set t_Co=256
"colorscheme gruvbox
"colorscheme one
"colorscheme challenger_deep
"set background=light
set background=dark

" if you prefer the default one, comment out this line
"let g:equinusocio_material_style='darker'

" comment out this line to make vertsplit invisible
let g:equinusocio_material_vertsplit='visible'

colorscheme equinusocio_material

" this theme has a buildin lightline theme, you can turn it on
let g:lightline = {
    \ 'colorscheme': 'equinusocio_material',
    \ }


"Python Syntax Plus
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

"GUI setting
set guifont=Input\ Mono:h20
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
" Quickly Run
            map <leader>r :call CompileRun()<CR>
            func! CompileRun()
                exec "w"
                if &filetype == 'c'
                    exec '!gcc % -o %<'
                    exec '!time ./%<'
                    exec '!trash %<'
                elseif &filetype == 'cpp'
                    exec '!g++ % -o %<'
                    exec '!time ./%<'
                    exec '!rm %'
                elseif &filetype == 'python'
                    exec '!python3 %'
                elseif &filetype == 'tex'
                    exec '!xelatex %'
                :endif

" Goyo
"
nmap <leader>g :Goyo<CR>

""""""""""""""""""Vimtex setting""""""""""""""""""
"""LATEX Snippts
	" Word count:
	autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i
        :endfunction
