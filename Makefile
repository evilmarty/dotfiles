LINK=ln -sf $(CURDIR)
BUNDLE_PATH=$(HOME)/.vim/bundle
VUNDLE_PATH=$(BUNDLE_PATH)/Vundle.vim
VUNDLE_URL=https://github.com/gmarik/Vundle.vim.git
CONFIG_PATH=$(HOME)/.config
HOMEBREW=$(shell which brew)

install: homebrew bash inputrc git vim nvim tmux iterm

homebrew: $(HOMEBREW) Brewfile
ifndef HOMEBREW
	/usr/bin/ruby -e "$(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif
	brew tap-info homebrew/bundle 2> /dev/null || brew tap homebrew/bundle
	brew bundle --global

Brewfile: FORCE
	$(LINK)/.Brewfile $(HOME)/.Brewfile

bash: bash_profile bash_profile

bash_profile: FORCE
	$(LINK)/.bash_profile $(HOME)/.bash_profile

bash_prompt: FORCE
	$(LINK)/.bash_prompt $(HOME)/.bash_prompt

inputrc: FORCE
	$(LINK)/.inputrc $(HOME)/.inputrc

git: FORCE
	$(LINK)/.gitconfig $(HOME)/.gitconfig
	$(LINK)/.gitignore_global $(HOME)/.gitignore_global

vim: FORCE
	$(LINK)/.vimrc $(HOME)/.vimrc
	$(LINK)/.vimrc $(HOME)/.gvimrc
	mkdir -p $(BUNDLE_PATH)
	if [ ! -d $(VUNDLE_PATH) ]; then git clone -q $(VUNDLE_URL) $(VUNDLE_PATH) 2> /dev/null; fi
	vim +PluginInstall +qall

nvim: config
	mkdir -p $(CONFIG_PATH)/nvim
	$(LINK)/.config/nvim/init.vim $(CONFIG_PATH)/nvim/init.vim
	pip3 install --upgrade neovim
	nvim -c 'call dein#install()'

tmux: FORCE
	$(LINK)/.tmux.conf $(HOME)/.tmux.conf

iterm: config
	mkdir -p $(CONFIG_PATH)/iterm
	$(LINK)/.config/iterm/com.googlecode.iterm2.plist $(CONFIG_PATH)/iterm/com.googlecode.iterm2.plist
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$(CONFIG_PATH)/iterm"
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

config: $(CONFIG_PATH)
	mkdir -p $(CONFIG_PATH)

FORCE:
