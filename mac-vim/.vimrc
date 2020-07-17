autocmd! BufWritePost $MYVIMRC source $MYVIMRC
if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif
set fileencodings=UTF-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=UTF-8
"共享剪切板
set clipboard=unnamed
"显示行号,显示相对行号
set relativenumber
set nu
"设置tab长度为4
set expandtab
set tabstop=4
"设置自动缩进长度为2
set shiftwidth=2
set softtabstop=2
"突出显示当行
set cursorline
"显示输入命令
set showcmd
"总是显示状态栏
set laststatus=2
"使用xshell连接vim显示Vim-airline色彩
set t_Co=256
set formatoptions-=tc
set helplang=cn
"显示搜索高亮
set hlsearch
" 因为上次搜索的内容在关闭vim后，重新打开，此句执行后将取消之前搜索的高亮。
exec "nohlsearch"
"搜索结果
noremap n nzz
noremap N Nzz
"历史指令记录
set history=500
"启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"显示括号匹配
set showmatch
"把tab显示为括号
set list
set listchars=tab:▸\ ,trail:▫
"光标移动到顶部和底部时保持5行距离
set scrolloff=5
"长行自动显示折行
set wrap
set tw=0
"使回车键能正常处理indent,eol,start
set backspace=indent,eol,start
"显示行号和列号(默认打开)
set ruler

set complete-=k complete+=k
"搜索时忽略大小写
set ignorecase
" 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果。
set incsearch
"记住上一次光标退出位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif""""")""")""")
" 如果同时开启set ignorecase，那么对只有一个大写字母的搜索词，将大小写敏感，其他情况都是大小写不敏感。如搜Test时，将不匹配test;搜test时，将匹配Test.
set smartcase
"把mapleader映射为空格键
let mapleader=" "
"把:映射为;
 map ; :
"把q:映射为\q
 map \q q:
"输入空格/就等于:!  如空格/ls,就是在vim中执行ls
 map <LEADER>/ :!
"输入空格r就等于:r !  如空格rls,就是把ls的输出读取进来
 map <LEADER>r :r !
map <LEADER>sr :%s///g
"把:q映射为Q,<CR>是回车的意思,Q直接退出vim
map Q :q<CR>
map R :call VIM_reload()<CR>
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
syntax enable
syntax on
set background=dark
colorscheme solarized
hi comment ctermfg=6 
set backspace=2
autocmd BufNewFile *.py,*.sh,*.md exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1, "#!/bin/bash")
        call setline(2, "#Author:liuml")
        call setline(3, "#Blog:https://jiqinga.github.io")
        call setline(4, "#Time:".strftime("%F %T"))
        call setline(5, "#Name:".expand("%"))
    endif
    if &filetype == 'python'
        call setline(1, "#!/usr/bin/python")
        call setline(2, "# encoding: utf-8")
        call setline(3, "#Author:liuml")
        call setline(4, "#Time:".strftime("%F %T"))
        call setline(5, "#Name:".expand("%"))
    endif
    if &filetype == 'markdown'
        call setline(1, "---")
        call setline(2, "title: ".expand("%"))
        call setline(3, "tags:")
        call setline(4,"  - docker")
        call setline(5,"  - ")
        call setline(6,"  - ")
        call setline(7,"categories:")
        call setline(8,"  - install-K8s")
        call setline(9,"  - ")
        call setline(10,"  - ")
        call setline(11, "date: ".strftime("%F %T"))
        call setline(12, "---")
    endif
	normal G
	normal o
endfunc
