all:
	@git submodule init
	@git submodule update -f

check:
	@rpm -q python-jedi &>/dev/null || ( echo "python-jedi is not installed"; exit 1 )
	@rpm -q python3-jedi &>/dev/null || ( echo "python3-jedi is not installed"; exit 1 )
	@rpm -q python-flake8 &>/dev/null || ( echo "python-flake8 is not installed"; exit 1 )
	@rpm -q python3-flake8 &>/dev/null || ( echo "python3-flake8 is not installed"; exit 1 )
	@rpm -q git &>/dev/null || ( echo "git is not isntalled"; exit 1 )
	@rpm -q vim-latex &>/dev/null || ( echo "vim-latex is not installed"; exit 1 )

install: all check
	@cp -pr $(shell pwd)/.vimrc ~/.vimrc
	@cp -pr $(shell pwd)/.gvimrc ~/.gvimrc
	@cp -pr $(shell pwd)/.vim ~/.vim
	@vim +PluginInstall +qall

uninstall:
	@rm -f ~/.vimrc
	@rm -f ~/.gvimrc
	@rm -rf ~/.vim

update-modules: all
	@git submodule foreach git pull origin master
