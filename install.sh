#!/usr/bin/env sh

SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"

ln -sf $DIR/bash_profile $HOME/.bash_profile
# ln -sf $DIR/bashrc $HOME/.bashrc

ln -sf $DIR/inputrc $HOME/.inputrc

ln -sf $DIR/irbrc $HOME/.irbrc

ln -sf $HOME/.vim/vimrc $HOME/.vimrc
ln -sf $HOME/.vim/gvimrc $HOME/.gvimrc

cp -iv $DIR/gitconfig $HOME/.gitconfig

git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

vim +BundleInstall +qall
