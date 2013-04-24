#!/usr/bin/env sh

SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"
SUBLIME_TEXT_DIR="$HOME/Library/Application\ Support/Sublime\ Text\ 2/"

rm -f $HOME/.bash_profile
ln -sf $DIR/bash_profile $HOME/.bash_profile
# ln -sf $DIR/bashrc $HOME/.bashrc

rm -f $HOME/.inputrc
ln -sf $DIR/inputrc $HOME/.inputrc

rm -f $HOME/.irbrc
ln -sf $DIR/irbrc $HOME/.irbrc

rm -f $HOME/.vimrc
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
rm -f $HOME/.gvimrc
ln -sf $HOME/.vim/gvimrc $HOME/.gvimrc

rm -f $HOME/.gitconfig
ln -sf $DIR/gitconfig $HOME/.gitconfig

rm -f $HOME/.gitignore_global
ln -sf $DIR/gitignore_global $HOME/.gitconfig_global

read -p "Setup Sublime Text 2? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  rm $SUBLIME_TEXT_DIR/Packages/User
  ln -s $DIR $SUBLIME_TEXT_DIR/Packages/User
fi

rm -f $HOME/Library/Preferences/com.googlecode.iterm2.plist
ln -sf $DIR/com.googlecode.iterm2.plist $HOME/Library/Preferences/

git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

vim +BundleInstall +qall
