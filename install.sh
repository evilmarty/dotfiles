#!/usr/bin/env sh

SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"
SUBLIME_TEXT_DIR="~/Library/Application\ Support/Sublime\ Text\ 2/"

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
  rm $SUBLIME_TEXT_DIR/Installed\ Packages
  rm $SUBLIME_TEXT_DIR/Packages
  rm $SUBLIME_TEXT_DIR/Pristine\ Packages
  
  ln -s $DIR/Sublime\ Text\ 2/Installed\ Packages $SUBLIME_TEXT_DIR/Installed\ Packages
  ln -s $DIR/Sublime\ Text\ 2/Packages $SUBLIME_TEXT_DIR/Packages
  ln -s $DIR/Sublime\ Text\ 2/Pristine\ Packages $SUBLIME_TEXT_DIR/Pristine\ Packages
fi

git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

vim +BundleInstall +qall
