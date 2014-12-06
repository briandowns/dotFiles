#
# Setup dotFiles
#

# IF the file exits, leave it alone.  If not, create the symlinks
all:
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc

# Get rid fo the files.
clean:
	[ -f ~/.vimrc ] && rm ~/.vimrc
	[ -f ~/.zshrc ] && rm ~/.zshrc

.PHONY: all
