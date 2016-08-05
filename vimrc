"如果配置文件存在则启动vundle插件管理器
if filereadable(expand("~/.vimrc.vundle"))
	source ~/.vimrc.vundle
endif



"关闭vi兼容模式
set nocompatible
"检测文件类型，与vundle不兼容
"filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许文件类型插件
filetype plugin on
"启动根据文件类型自动补全
filetype plugin indent on


"设置颜色方案
colorscheme elflord
"开启代码高亮
syntax enable
"打开高亮
syntax on


"显示行号
set nu
"允许代码折叠
set foldenable
"代码折叠方式为手动折叠，使用zm,zr命令
set foldmethod=manual
"设置补全窗口的格式，就算只有一个匹配都显示一个弹出菜单，只匹配最长的文本
set completeopt=menuone,longest

"改进的autoindent，但是在cindent开启时无效
set smartindent
"c风格缩进
set cindent
"一个tab占4个空格的位置
set tabstop=4
"每次退格删除4个空格
set softtabstop=4
"每层缩进的空格数
set shiftwidth=4
"不将输入的tab自动转为空格
set noexpandtab
"在行首按tab时将输入shiftwidth个空格
set smarttab

"设置vim程序使用的编码方式
set enc=utf-8
"设置文件编码方式
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"设置菜单语言
set langmenu=en_US.UTF-8
"设置帮助文档语言
set helplang=en

"文件在外部被修改时即时更新
set autoread
"进行make，切换文件等操作时自动保存。
set autowrite

"搜索时即时高亮匹配
set incsearch
"高亮搜索
set hlsearch
"搜索时忽略大小写
set ignorecase

"行高亮
"set cursorline
"列高亮，与函数列表有冲突
"set cursorcolumn



""""""""""""""""""""""""""""""
"基本键绑定
"Leader键;
let mapleader = ";"

"普通键区映射
"Enter代替G，Backspace代替gg
"nnoremap <CR> G
"nnoremap <BS> gg

"让光标上下移动的时候居中
nnoremap j jzz
nnoremap k kzz

"让上下翻页以后光标居中
nnoremap <C-F> <C-F>zz
nnoremap <C-B> <C-B>zz


"F键区绑定
"<F3>执行当前正在编辑的文件
nnoremap <F3> <C-[> :call Exec() <CR>
inoremap <F3> <C-[> :call Exec() <CR>
vnoremap <F3> <C-[> :call Exec() <CR>

"<F4>打开/关闭qucikfix窗口
nnoremap <F4> <C-[> :call CWToggle() <CR>
inoremap <F4> <C-[> :call CWToggle() <CR>
vnoremap <F4> <C-[> :call CWToggle() <CR>


"<F5>保存所有的文件以后执行make
nnoremap <F5> <C-[> :call Make() <CR>
inoremap <F5> <C-[> :call Make() <CR>
vnoremap <F5> <C-[> :call Make() <CR>

"<F6>执行make exec
nnoremap <F6> <C-[> :call MakeExec() <CR>
inoremap <F6> <C-[> :call MakeExec() <CR>
vnoremap <F6> <C-[> :call MakeExec() <CR>

"<F7>执行make debug进行调试
nnoremap <F7> <C-[> :make debug <CR>
inoremap <F7> <C-[> :make debug <CR>
vnoremap <F7> <C-[> :make debug <CR>

"<F8>显示taglist
nnoremap <F8> <C-[> :TlistToggle <CR>
inoremap <F8> <C-[> :TlistToggle <CR>
vnoremap <F8> <C-[> :TlistToggle <CR>


"<F12>缩进当前光标所在{}之间的代码
nnoremap <F12> <C-[> =a{ '' zz
inoremap <F12> <C-[> =a{ '' zz
vnoremap <F12> <C-[> =a{ '' zz

"<Leader> <F12> 缩进当前文本
nnoremap <Leader><F12> <C-[> gg=G '' zz
inoremap <Leader><F12> <C-[> gg=G '' zz
vnoremap <Leader><F12> <C-[> gg=G '' zz


""""""""""""""""""""""""""""""
"自定义的函数
"保存全部文件并且make
function! Make()
	exec "wa"
	:!catkin_make -C ~/ros_ws/
endfunction

"保存全部文件并且make exec
function! MakeExec()
	exec "wa"
	:make exec
endfunction

"运行当前正在编辑的文件
function! Exec()
	exec "wa"
	:!./%
endfunction

"toggle cw
let g:CWToggle = 0
function! CWToggle()
	if g:CWToggle == 0
		exec "copen"
		let g:CWToggle = 1
	else
		exec "cclose"
		let g:CWToggle = 0
	endif
endfunction


"自定义的命令
command! DeleteEOLSpace :%s/\s\+$//g

"最后如果插件配置文件存在则加载插件配置文件
if filereadable(expand("~/.vimrc.plugin"))
	source ~/.vimrc.plugin
endif
