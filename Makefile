all:
	@git submodule init
	@git submodule update
	@git submodule foreach git submodule init
	@git submodule foreach git submodule update

install: all
	@ln -sf $(shell pwd)/.vimrc ~/.vimrc
	@ln -sf $(shell pwd)/.gvimrc ~/.gvimrc
	@ln -sf $(shell pwd)/.vim ~/.vim

uninstall:
	@rm -f ~/.vimrc
	@rm -f ~/.gvimrc
	@rm -f ~/.vim
