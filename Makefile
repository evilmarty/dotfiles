LINK=ln -sf $(CURDIR)
BUNDLE_PATH=$(HOME)/.vim/bundle
VUNDLE_URL=https://github.com/gmarik/vundle.git

install: bash_profile inputrc git vim

bash_profile:
	$(LINK)/bash_profile $(HOME)/.bash_profile

inputrc:
	$(LINK)/inputrc $(HOME)/.inputrc

git:
	$(LINK)/gitconfig $(HOME)/.gitconfig
	$(LINK)/gitignore_global $(HOME)/.gitignore_global

vim:
	$(LINK)/vimrc $(HOME)/.vimrc
	$(LINK)/vimrc $(HOME)/.gvimrc
	mkdir -p $(BUNDLE_PATH)
	if [ ! -d $(BUNDLE_PATH)/vundle ]; then git clone -q -n $(VUNDLE_URL) $(BUNDLE_PATH)/vundle 2> /dev/null; fi
	vim +BundleInstall +qall


