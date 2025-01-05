HOMEBREW_INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
CONFIG_PATH=$(HOME)/.config
HOMEBREW=$(shell which brew)

.PHONY: home install update homebrew

homebrew:
ifndef $(HOMEBREW)
  bash -c "$$(curl -fsSL $(HOMEBREW_INSTALL_URL))"
endif
	brew tap-info homebrew/bundle 2> /dev/null || brew tap homebrew/bundle
	brew bundle --file .Brewfile

install: homebrew

update: homebrew

home:
	git ls-files | xargs -n 1 dirname | sort -u | xargs -I % -n 1 mkdir -p $(HOME)/%
	git ls-files | xargs -n 1 -I % cp -f % $(HOME)/%
	cp -fR .git $(HOME)
