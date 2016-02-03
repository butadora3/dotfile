#/bin/sh

ln -sf ~/dotfile/_vimrc ~/.vimrc
ln -sf ~/dotfile/_zshrc ~/.zshrc
ln -sf ~/dotfile/vimfiles ~/.vim
#ln -sf ~/dotfile/pyenv ~/.pyenv

mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/bundle
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git submodule init
git submodule update
