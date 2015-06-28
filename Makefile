LINK=ln -sf $(CURDIR)
BUNDLE_PATH=$(HOME)/.vim/bundle
VUNDLE_PATH=$(BUNDLE_PATH)/Vundle.vim
VUNDLE_URL=https://github.com/gmarik/Vundle.vim.git
PROMPT_THEME?=jelly

install: bash_profile inputrc git vim prompt

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
	if [ ! -d $(VUNDLE_PATH) ]; then git clone -q -n $(VUNDLE_URL) $(VUNDLE_PATH) 2> /dev/null; fi
	vim +PluginInstall +qall

promptline: promptline/presets/custom.vim
	cp powerline/presets/custom.vim $(BUNDLE_PATH)/promptline.vim/autoload/promptline/presets/

prompt: promptline
	vim +"PromptlineSnapshot! $(HOME)/.bash_prompt $(PROMPT_THEME) custom" +qall && echo "Bash prompt installed"
