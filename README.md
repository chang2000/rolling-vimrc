#  Vim Config build from scratch

> 如果全世界的程序员能将折腾编辑器的时间减少一半，...
>
> If all the programmers can spend less time playing with editors...

## Introduction:
删掉原来vim仓库开这个新的vim仓库的初衷很复杂。核心原因还是想让自己对一个编辑器的构成有更加全面的了解。

这个仓库力求做到，每一个功能都有其存在的意义，一点不多一点不少，脉络清晰。

可能会在以后尝试模块化配置文件，也许也是必须要干的事情。

The reasons that I delete my original vim configuration and start a new one is complex. The core reason is that I want to have a full understanding of the structure of an editor.

This repository is devoted to customize an editor, that every function in it, just like autocomplete, highlight, snippets, has it's meaning and is the most suitable for me. This idea is inspired by [Use Vim as IDE](https://github.com/yangyangwithgnu/use_vim_as_ide).

I will try to make it modulated later, and it's necessary for better management.

## Architecture & Plugins:

I use [vim-plug](https://github.com/junegunn/vim-plug) to manage pulgins. The plugins I am using up to now:

* [nerdTree](https://github.com/scrooloose/nerdtree), a file manager for vim

* identPython, indent enhancement for Python

* [identLine](https://github.com/Yggdroot/indentLine), show the indent line

* [nerdCommenter](https://github.com/scrooloose/nerdcommenter), comment code easily

* [vim-colors](https://github.com/jakwings/vim-colors), manage the color schemes

* [YCM](https://github.com/Valloric/YouCompleteMe), historic autocomplete plugins. I will show you the full installation later.

* [Vimtex](https://github.com/lervag/vimtex), LaTeX enhancement for LaTeX and Markdown


* To Be continued...

## Tips:

The main configuration file is actually `~/.vim/vimrc`, thus you'd better delete the `.vimrc` in in your home dictionary. Or, to make it more safe, create a `vimrc` with only one line
```bash
source ~/.vim/virmc
```



## Some Loooooonglasting Issuse with this configuration:

* Color Display

  Some scripts has been added to `vimrc` to ensure the emulator to show the true color of your pretty color scheme.

* to be continued...

