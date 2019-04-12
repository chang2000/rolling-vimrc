"|\     /|\__   __/(       )(  ____ )(  ____ \
"| )   ( |   ) (   | () () || (    )|| (    \/
"| |   | |   | |   | || || || (____)|| |
"( (   ) )   | |   | |(_)| ||     __)| |
" \ \_/ /    | |   | |   | || (\ (   | |
"  \   /  ___) (___| )   ( || ) \ \__| (____/\
"   \_/   \_______/|/     \||/   \__/(_______/
"
set nocompatible              " required
filetype off                  " required
au FIleType perl set filetype=prolog
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
"Python 优化
Plug 'vim-scripts/indentpython.vim'
"显示缩进线
Plug 'Yggdroot/indentLine'

"括号自动补全
Plug 'jiangmiao/auto-pairs'
" 多行注释
Plug 'scrooloose/nerdcommenter'

"" 为了美观, 所有的色彩插件位于该目录下
Plug 'jakwings/vim-colors'

""""""""""PythonSyntaxEnhencement""""""""""
Plug 'vim-python/python-syntax'
"YCM!!!!!!!!!!!!!!!!!!!!
Plug 'Valloric/YouCompleteMe'

" vim-hardtime
Plug 'takac/vim-hardtime'

" vim tex plugin
Plug 'lervag/vimtex'
call plug#end()


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

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
set ruler
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
"-------------优化命令-----------------
vnoremap <Leader>y "+y
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T"
set background=dark


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
" nerdcommenter默认热键<leader>为'\'，这里热键设置为'SPACE'

" 设置注释快捷键
nmap <leader>cm  <leader>ci<CR>

"-----------------color------------------
set t_Co=256
colorscheme gruvbox
"
"Python Syntax Plus
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0



"""""""""""""""""""YouCompleteMe"""""""""""""""""""
"" 自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme 默认tab s-tab 和自动补全冲突
"1let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第3个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
"inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = 'path to .ycm_extra_conf.py'
"
"
""-----------------GUI-Setting____________-
set guifont=Hack:h18
set linespace=6

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>b :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!gcc % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!python3 %'
    elseif &filetype == 'perl'
        exec '!perl %'
    elseif &filetype == 'tex'
        exec '!xelatex %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc

" vim-hard time
let g:hardtime_default_on = 0
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
let g:hardtime_timeout = 100
let g:hardtime_maxcount = 2
let g:hardtime_showmsg = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
let g:hardtime_allow_different_key = 1

"""""""""""""""""personal habit""""""""""""""""""""""""""""""""""""""""
:command WQ wq
:command Wq wq
:command W w
:command Q q
:nmap <leader>y +"y
"Remove trailing space before saving
autocmd BufWritePre * %s/\s\+$//e
""""""""""""""""Code Fold"""""""""""""""""

set foldmethod=indent
set foldlevelstart=99

"open file at the last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""Vimtex setting""""""""""""""""""
set conceallevel=1
let g:tex_conceal='abdmg'

