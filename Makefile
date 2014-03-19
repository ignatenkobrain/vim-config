all:
	@git submodule init
	@git submodule update -f

check:
	@rpm -q python-jedi &>/dev/null || ( echo "python-jedi is not installed"; exit 1 )
	@rpm -q python3-jedi &>/dev/null || ( echo "python3-jedi is not installed"; exit 1 )
	@rpm -q git &>/dev/null || ( echo "git is not isntalled"; exit 1 )

install: all check
	@ln -sf $(shell pwd)/.vimrc ~/.vimrc
	@ln -sf $(shell pwd)/.gvimrc ~/.gvimrc
	@ln -sf $(shell pwd)/.vim ~/.vim

uninstall:
	@rm -f ~/.vimrc
	@rm -f ~/.gvimrc
	@rm -f ~/.vim

update:
	@git submodule foreach git pull origin master
