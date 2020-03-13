VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
CONFIG_PATH=$(HOME)/.config
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
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs "$(VIM_PLUG_URL)"
	vim +PluginInstall +qall

nvim: FORCE
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs "$(VIM_PLUG_URL)"
	nvim -c ':PlugInstall' -c ':qall'

iterm: config
	defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$(CONFIG_PATH)/iterm"
	defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

FORCE:
