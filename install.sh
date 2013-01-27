#!/usr/bin/env sh

SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"
SUBLIME_TEXT_DIR="$HOME/Library/Application\ Support/Sublime\ Text\ 2/"

ln -sf $DIR/bash_profile $HOME/.bash_profile
# ln -sf $DIR/bashrc $HOME/.bashrc

ln -sf $DIR/inputrc $HOME/.inputrc

ln -sf $DIR/irbrc $HOME/.irbrc

ln -sf $HOME/.vim/vimrc $HOME/.vimrc
ln -sf $HOME/.vim/gvimrc $HOME/.gvimrc

cp -iv $DIR/gitconfig $HOME/.gitconfig

read -p "Setup Sublime Text 2? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  rm $SUBLIME_TEXT_DIR/Packages/User
  ln -s $DIR/Sublime\ Text\ 2 $SUBLIME_TEXT_DIR/Packages/User
fi

ln -sf $DIR/com.googlecode.iterm2.plist ~/Library/Preferences/

git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

vim +BundleInstall +qall
