HOMEBREW_INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
OHMYZSH_INSTALL_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
CONFIG_PATH=$(HOME)/.config
HOMEBREW=$(shell which brew)
REPO_DIR=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: home install update homebrew ohmyzsh gitconfig

homebrew:
ifndef HOMEBREW
	sh -c "$$(curl -fsSL $(HOMEBREW_INSTALL_URL))"
endif
	$(HOMEBREW) tap-info homebrew/bundle 2> /dev/null || $(HOMEBREW) tap homebrew/bundle
	$(HOMEBREW) bundle --file .Brewfile

ohmyzsh:
ifeq ($(origin ZSH),undefined)
	sh -c "$$(curl -fsSL $(OHMYZSH_INSTALL_URL))"
else
	@echo "ZSH is already installed at $(ZSH)"
endif

install: homebrew gitconfig ohmyezsh

update: homebrew

home:
	git ls-files | xargs -n 1 dirname | sort -u | xargs -I % -n 1 mkdir -p $(HOME)/%
	git ls-files | xargs -n 1 -I % cp -f % $(HOME)/%
	cp -fR .git $(HOME)

gitconfig:
	git config set --global --path include.path "$(REPO_DIR)/.gitconfig_global"
