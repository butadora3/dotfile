#!/bin/sh

# ~/.vimrc
if [-e ~/.vim]; then
	rm -f ~/.vim
fi
ln -s ~/dotfiles/vimfiles ~/.vim
# ~/.vimrc
ln -s ~/dotfiles/_vimrc ~/.vimrc
