.PHONY:install

install:vimrc vimrc.plugin vimrc.vundle
	@echo "Installing vimrcs..."
	install --mode=0644 vimrc ~/.vimrc
	install --mode=0644 vimrc.vundle ~/.vimrc.vundle
	install --mode=0644 vimrc.plugin ~/.vimrc.plugin
