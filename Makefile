all:
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/vimrc ~/.zshrc

clean:
	[ -f ~/.vimrc ] || rm ~/.vimrc
	[ -f ~/.zshrc ] || rm ~/.zshrc

.PHONY: all
