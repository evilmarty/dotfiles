HOMEBREW_INSTALL_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
OHMYZSH_INSTALL_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
CONFIG_PATH=$(HOME)/.config
HOMEBREW=$(shell which brew)

.PHONY: home install update homebrew

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

install: homebrew ohmyezsh

update: homebrew

home:
	git ls-files | xargs -n 1 dirname | sort -u | xargs -I % -n 1 mkdir -p $(HOME)/%
	git ls-files | xargs -n 1 -I % cp -f % $(HOME)/%
	cp -fR .git $(HOME)
