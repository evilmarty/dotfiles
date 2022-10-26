VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
HOMEBREW_INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
CONFIG_PATH=$(HOME)/.config
HOMEBREW=$(shell which brew)

home:
	git ls-files | xargs -n 1 dirname | sort -u | xargs -I % -n 1 mkdir -p $(HOME)/%
	git ls-files | xargs -n 1 -I % cp -f % $(HOME)/%
	cp -fR .git $(HOME)

install: homebrew
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs "$(VIM_PLUG_URL)"
	vim -c ':PlugInstall' -c ':qall'
	pip3 install --user pynvim
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$(CONFIG_PATH)/iterm"
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

update: homebrew
	vim -c ':PlugUpdate' -c 'qall'

homebrew: $(HOMEBREW) .Brewfile
ifndef $(HOMEBREW)
  bash -c "$$(curl -fsSL $(HOMEBREW_INSTALL_URL))"
endif
	brew tap-info homebrew/bundle 2> /dev/null || brew tap homebrew/bundle
	brew bundle --file .Brewfile

.PHONY: home
