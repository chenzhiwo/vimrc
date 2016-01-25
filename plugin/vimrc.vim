"更新vimrcs文件的函数
function! Updatevimrc()
	!make install -C ~/.vim/bundle/vimrc/
endfunction

"用户指令,在vim中输入:Updatevimrc 即可安装vundle下载的vimrc
command! Updatevimrc :call Updatevimrc()
