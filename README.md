<h1 align="center" style="font-family:georgia">Rolling Vim Configuration</h1>
<h4 align="center">Lightweight and Easy to Deploy</h4>
<hr/>
<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/9/9f/Vimlogo.svg" width="250" height="250"/>
</p>

<p align="center">
<a href="https://github.com/chang2000/rolling-vimrc"><img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" alt="Maintenance"></a>
<a href="https://www.gnu.org/licenses/gpl-3.0"><img src="https://img.shields.io/badge/License-GPL%20v3-blue.svg" alt="GPL License"></a>
<a href="https://github.com/sindresorhus/awesome"><img src="https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg" alt="Awesome"></a>
</p>



> 如果全世界的程序员能将折腾编辑器的时间减少一半...
>
> If all the programmers can spend less time playing with editors...

## Introduction:
删掉原来vim仓库开这个新的vim仓库的初衷很复杂。核心原因还是想让自己对一个编辑器的构成有更加全面的了解。

这个仓库力求做到，每一个功能都有其存在的意义，一点不多一点不少，脉络清晰。

可能会在以后尝试模块化配置文件，也许也是必须要干的事情。

The reasons why I decided to start a new configuration from scratch is complex. The core reason is that I want to have a full understanding of the structure and every functions of an editor.

This repository is devoted to customize an editor, which every function in it, like autocomplete, highlight, snippets, is the best solution for me. And I know exactly why I introduce them to my configuratoin. It is inspired by [Use Vim as IDE](https://github.com/yangyangwithgnu/use_vim_as_ide).

I will try to make it modulated later if I get some free time, and it's necessary for better management.



## Updates

**I switched to NeoVim!**

But why?

[Check it out](https://neovim.io/)

All the reasons are iterally on the link above.

And for me, the high performance and a better graphic experience are the rocking points.



## Installation(tested on macOS)

Install neovim(skip if you already done)

```bash
brew install neovim
```

Back up your original Neovim configuration(if you have one)

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

 Clone this repository

```
git clone https://https://github.com/chang2000/rolling-vimrc ~/.config/nvim
```

Use `nvim` to start neovim, then type `:PlugInstall` to install extensions.

**Happy hacking!**

## Architecture & Plugins:

I use [vim-plug](https://github.com/junegunn/vim-plug) to manage pulgins(Vundle, another package manager, is kinda old and slow). Plugins I recommand:

* [nerdTree](https://github.com/scrooloose/nerdtree), a file manager for vim

* [identLine](https://github.com/Yggdroot/indentLine), show the indent line

* [nerdCommenter](https://github.com/scrooloose/nerdcommenter), comment code easily

~~* [vim-colors](https://github.com/jakwings/vim-colors), manage the color schemes~~
  > I started to use separate color-scheme plugins. Like Gruvbox, One and challenger_deep, refer to vimrc for details.

* ~~[YCM](https://github.com/Valloric/YouCompleteMe), historic autocomplete plugins. I will show you the full installation later.~~

* YCM is highly demanding for users to learn. [coc.nvim](https://github.com/neoclide/coc.nvim) has easier installation and better default, which will save your life. 
  
> To install coc.nvim, make sure you have node or node.js installed, refer to the coc repo above for details.

* ~~[Vimtex](https://github.com/lervag/vimtex), LaTeX enhancement for LaTeX and Markdown~~
  
  > Vimtex is good with the help of Skim, a pdf viewer supports real-time sync. I prefer editing LaTeX by Emacs now.
  
* [goyo](https://github.com/junegunn/goyo.vim), 🌷 Distraction-free writing in Vim

* Vim-Bookmark

* To be continued...

## Features & Some vimscript
* Emacs Cursor Moving Method under Insert Mode
	
	> Use `C-f` and `C-b` to move cursor around, go and have a fluent experience when dealing with the parentheses of a function.
* QuickRun Support

``` vim
" Quick Run
            map <leader>r :call CompileRun()<CR> " Space + R to run code immediately
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

```
## Tips:

The main configuration file is actually `~/nvim/init.vim`, thus you'd better delete the `.vimrc` in in your home dictionary. Refer to the Neovim site for more detailed information.



## Some Loooooonglasting Issues with this configuration:

* Color Display

  Some scripts has been added to `vimrc` to ensure the emulator to show the true color of your pretty color scheme.
  
* Autocomplete
  
  Actually Vim does have a build-in autocomplete function but need to use `<C-n> or <C-p>` to invoke. [SuperTab](https://github.com/ervandew/supertab) is recommanded and it allows you to use `<Tab>` to perform the completetion.
  
* to be continued...

