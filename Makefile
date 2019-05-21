BUNDLE_PATH=$(HOME)/.vim/bundle
VUNDLE_PATH=$(BUNDLE_PATH)/Vundle.vim
VUNDLE_URL=https://github.com/gmarik/Vundle.vim.git
CONFIG_PATH=$(HOME)/.config
CACHE_PATH=$(HOME)/.cache
HOMEBREW=$(shell which brew)

home: FORCE
	git ls-files | xargs -n 1 dirname | sort -u | xargs -I % -n 1 mkdir -p $(HOME)/%
	git ls-files | xargs -n 1 -I % cp -f % $(HOME)/%
	cp -fR .git $(HOME)

install: homebrew vim nvim iterm

homebrew: $(HOMEBREW) .Brewfile
ifndef $(HOMEBREW)
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | /usr/bin/ruby
endif
	brew tap-info homebrew/bundle 2> /dev/null || brew tap homebrew/bundle
	brew bundle --global

vim: FORCE
	mkdir -p $(BUNDLE_PATH)
	if [ ! -d $(VUNDLE_PATH) ]; then git clone -q $(VUNDLE_URL) $(VUNDLE_PATH) 2> /dev/null; fi
	vim +PluginInstall +qall

nvim: FORCE
	mkdir -p $(CACHE_PATH)/dein
	curl -s https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh -s $(CACHE_PATH)/dein
	pip3 install --upgrade neovim
	nvim -c 'call dein#install()'

iterm: config
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$(CONFIG_PATH)/iterm"
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

FORCE:
