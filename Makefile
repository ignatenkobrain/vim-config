check:
	@rpm -q python-jedi &>/dev/null || ( echo "python-jedi is not installed"; exit 1 )
	@rpm -q python3-jedi &>/dev/null || ( echo "python3-jedi is not installed"; exit 1 )
	@rpm -q python-flake8 &>/dev/null || ( echo "python-flake8 is not installed"; exit 1 )
	@rpm -q python3-flake8 &>/dev/null || ( echo "python3-flake8 is not installed"; exit 1 )
	@rpm -q git &>/dev/null || ( echo "git is not isntalled"; exit 1 )

install: check
	@cp -pr $(shell pwd)/.vimrc ~/.vimrc
	@git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
	@vim +PluginInstall +qall

uninstall:
	@rm -f ~/.vimrc
	@rm -f ~/.gvimrc
	@rm -rf ~/.vim

gui-resolution:
	@gvim -geometry 9999x9999 +"redir >/tmp/vim-config" +"set lines? columns?" +"redir END" +"quit"
	@sleep 1
	@cat /tmp/vim-config | tr -d "\n" | sed -e "s/^ /set/" -e "s/  / /g" > ~/.gvimrc
	@rm -rf /tmp/vim-config
