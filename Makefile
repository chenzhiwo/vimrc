.PHONY:install

install:vimrc vimrc.plugin vimrc.vundle
	@echo "Installing vimrcs..."
	install -m=644 vimrc ~/.vimrc
	install -m=644 vimrc.vundle ~/.vimrc.vundle
	install -m=644 vimrc.plugin ~/.vimrc.plugin
