" use Vundle to manage my vim package
"
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'  

"Python 优化
Plugin 'vim-scripts/indentpython.vim'
"显示缩进线
Plugin 'Yggdroot/indentLine'

"括号自动补全
Plugin 'jiangmiao/auto-pairs'
" 多行注释
Plugin 'scrooloose/nerdcommenter'

" 为了美观
Plugin 'jakwings/vim-colors'        

call vundle#end()            " required


filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.
set nowrap                 " nobreak for a line of code
set number
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.
set mouse=a
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

let mapleader="\<Space>"
"set list                   " Show non-printable characters.
"if has('multi_byte') && &encoding ==# 'utf-8'
"  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
"else
"  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
"endif


"--------------------Nerd-Tree----------------
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeWinSize=25
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 打开vim时自动打开NERDTree(暂时不使用)
"autocmd vimenter * NERDTree

"退出vim时自动关闭nerd-tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle nerd tree
nmap <leader>nn :NERDTreeToggle<CR>

"--------------show-indent-line-------------
"identLine默认是关闭的，因此需要在.vimrc中配置才能看到效果：
" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
let g:indentLine_char='¦'   

" 使indentline生效
let g:indentLine_enabled = 1


"--------------nerd-commenter---多行注释-------
" nerdcommenter默认热键<leader>为'\'，这里将热键设置为','

" 设置注释快捷键
map <leader>cm  <leader>ci<CR>

"-----------------color------------------
set t_Co=256 
colorscheme darkburn 

"-----------------GUI-Setting____________-
set guifont=eslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h15
