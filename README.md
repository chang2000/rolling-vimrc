# Vim Config --from scratch



> 如果全世界的程序员能将折腾编辑器的时间减少一半，...

## Introduction: 
删掉原来vim仓库开这个新的vim仓库的初衷很复杂。核心原因还是想让自己对一个编辑器的构成有更加全面的了解。
这个仓库力求做到，每一个功能都有其存在的意义，一点不多一点不少，脉络清晰。
可能会在以后尝试模块化配置文件，也许也是必须要干的事情。

## Architecture:

使用[vim-plug](https://github.com/junegunn/vim-plug)管理插件。在 ./.vim/vimrc的开头进行插件设置。目前安装的插件有：

* [nerdTree](https://github.com/scrooloose/nerdtree), 树形文件管理器
* identPython， 针对Python lang. 的缩进优化（pep8）
* [identLine](https://github.com/Yggdroot/indentLine), 显示缩进线
* [nerdCommenter](https://github.com/scrooloose/nerdcommenter), 多行注释。在Visual mode下选中使用<leader> + <cm>进行注释。
* [vim-colors](https://github.com/jakwings/vim-colors), 色彩管理工具
* [YCM](https://github.com/Valloric/YouCompleteMe),史诗级vim自动补全工具。安装较麻烦，环境很难处理，看情况出教程。

 

 
