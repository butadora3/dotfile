#/bin/sh

ln -s ~/dotfile/_vimrc ~/.vimrc
ln -s ~/dotfile/_zshrc ~/.zshrc
ln -s ~/dotfile/vimfiles ~/.vim

git submodule init
git submodule update
