Zsh And Vimrc
=========

A vim config to make a awesome IDE which is useful for code browsing and coding, currently just support for Ubuntu. 


Snapshot
========
![vim_screenshoot.jpg](https://raw.githubusercontent.com/nmaiti/zsh-vim-config/master/vim_screenshoot.png)

Features
========
 * Default colorschema is jay
 * vim-syntax-extra is added for more granular vim syntax highlighting
 * Kept powerline to remove cursor lag in airline

How to install:

    $ cd ~
    $ git clone https://github.com/nmaiti/zsh-vim-config.git
    $ cd zsh-vim-config
    $./install.sh
    $ zsh

done

Included Plugins
========

 * pathogen

 * CCTree

 * a_vim

 * ack.vim

 * ctrlp.vim

 * fugitive

 * indentLine

 * jay

 * nerdtree

 * python-mode

 * syntax

 * tabular

 * tagbar

 * vim-autoformat

 * vim-bufferline

 * vim-clang-format

 * vim-colors-solarized

 * vim-easymotion

 * vim-gitgutter

 * vim-github-colorscheme

 * vim-go

 * vim-linux-coding-style

 * vim-markdown-preview

 * vim-pasta

 * vim-powerline

 * vim-syntax-extra

 * vim-trailing-whitespace

 * vim-workspace

Key mapping
==========
Please using <tab>+<tab> to move cursor around view windows*

> | ***Window management***                                      |                                                              |
> | ------------------------------------------------------------ | ------------------------------------------------------------ |
> | Window enlarge/ shrink                                       | `, + LEFT`  Or  `, + RIGHT` Or `, + UP` Or `, + DOWN`        |
> | Movement between windows                                     | <tab> + <tab>                                                |
> | Switch between buffers                                       | `, + bn` for buffer next; `,+bp` for previous buffer         |
> | New Tab                                                      | `, + tn`                                                     |
> | Switch between tabs                                          | `<ctrl> + left  or <ctrl> +right`                            |
> | Move block of code (visual mode)                             | `>` Or `<`                                                   |
> | Remove unwanted spaces                                       | `, + rs`                                                        |
> | Remove last search highlight (visual + insert + command mode) | `<ctrl> + h`                                                 |
> | Quit window(s)                                               | `,x` to quit current window Or `,X` to remove ALL windows without saving |
> | Quick Save                                                   | `,s`save windows Or `, + ss`-create session workspace and start autosave                                             |
> | ***Code Management***                                        |                                                              |
> | Clang Formatting of full code (or selected code in visual mode) , vim-clang-format.vim (use .clang-format file if present) | `, + cf`                                                       |
> | Ctrlp                                                        | `<ctrl> + p`for ctrlp mixed; `<ctrl>+b` for ctrlP buffer     |
> | less for easier copy from file                               | `, + ls`                                                     |
> | Ack.vim                                                      | `, + ac` for ack whole dir; `, + aw`for ack for the word under current cursor position, , `+ af` to find file |
> | Tagbar Show (toogle) [visual+ insert+command mode]           | `, + tb` toggle the tagbar                                   |
> | Nerdtree                                                     | `<F5>` for toggle nerdtree; `R` to refresh when focus on nerdtree window |
> | CCTree  load  [for call tree]                                | `, + cc` to load cscope.out                                  |
> | CCTree window toggle                                         | `<ctrl + c> + w`                                             |
> | CCTree forward call trace (symbol under cursor)              | `<ctrl + c> + >`                                             |
> | CCTree reverse call trace (symbol under cursor)              | `<ctrl + c> + <`                                             |
> | CCTree tree depth                                            | `<ctrl + c> + ]` for increase `<ctrl + c> + [` to decrease   |
> | Cscope and ctags update                                      | `F6`  **Note**: do this before cctree load if symbols changed |
> | Cscope jump to definition                                    | `<ctrl> +  ]`                                                |
> | Cscope  called from                                          | `<ctrl + \> +  c`                                            |
> | Cscope  find symbol in files                                 | `<ctrl + \> +  s` for text search use `t` instead of `s`     |
> | Cscope  find files                                           | `<ctrl + \> +  f`                                            |
> | vim-autoformat Auto format  of C code                        | `, + fa`                                                     |
> | linux coding style formating                                 | `, + lx`                                                     |
> | EasyMotion Cursor movement                                   | `, + a`                                                      |
> | Auto Complete                                                | `<ctrl> + p` in insert mode                                   |
> | Python/go mode code jump                                     | `, + g` jump to definition of function/class/variable        |
> | Aliging using tabular                                       | follow [tabular doc](https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt) |
> |                                                              |                                                              |
>



