LINK=ln -sf $(CURDIR)
BUNDLE_PATH=$(HOME)/.vim/bundle
VUNDLE_PATH=$(BUNDLE_PATH)/Vundle.vim
VUNDLE_URL=https://github.com/gmarik/Vundle.vim.git
CONFIG_PATH=$(HOME)/.config
PROMPT_THEME?=jelly
HOMEBREW=$(shell which brew)

install: homebrew bash_profile inputrc git vim nvim prompt

homebrew: $(HOMEBREW) Brewfile
ifndef HOMEBREW
	/usr/bin/ruby -e "$(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif
	brew tap-info homebrew/bundle 2> /dev/null || brew tap homebrew/bundle
	brew bundle --global

Brewfile: FORCE
	$(LINK)/Brewfile $(HOME)/.Brewfile

bash_profile: FORCE
	$(LINK)/bash_profile $(HOME)/.bash_profile

inputrc: FORCE
	$(LINK)/inputrc $(HOME)/.inputrc

git: FORCE
	$(LINK)/gitconfig $(HOME)/.gitconfig
	$(LINK)/gitignore_global $(HOME)/.gitignore_global

vim: FORCE
	$(LINK)/vimrc $(HOME)/.vimrc
	$(LINK)/vimrc $(HOME)/.gvimrc
	mkdir -p $(BUNDLE_PATH)
	if [ ! -d $(VUNDLE_PATH) ]; then git clone -q $(VUNDLE_URL) $(VUNDLE_PATH) 2> /dev/null; fi
	vim +PluginInstall +qall

nvim: config
	mkdir -p $(CONFIG_PATH)/nvim
	$(LINK)/config/nvim.vim $(CONFIG_PATH)/nvim/init.vim
	pip3 install --upgrade neovim
	nvim -c 'call dein#install()'

config: $(CONFIG_PATH)
	mkdir -p $(CONFIG_PATH)

promptline: promptline/presets/custom.vim $(BUNDLE_PATH)/promptline.vim/*
	cp promptline/presets/custom.vim $(BUNDLE_PATH)/promptline.vim/autoload/promptline/presets/

prompt: promptline
	vim +"PromptlineSnapshot! $(HOME)/.bash_prompt $(PROMPT_THEME) custom" +qall && echo "Bash prompt installed"

FORCE:
