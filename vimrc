" Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kchmck/vim-coffee-script'
Bundle 'matze/vim-move'
Bundle 'mustache/vim-mode'

filetype plugin indent on

runtime macros/matchit.vim " Match pairs of keywords (Eg: def, end)

" Wildmenu
set wildmenu
set wildmode=longest,full

" Search
set ignorecase " Case insensitive search
set incsearch  " Makes search act like search in modern browsers
set hlsearch   " Highlight search results

" Whitespace
set list                      " Show invisibles by default
set listchars=tab:▸\ ,trail:· " Show tabs, trailing whitespace and end of lines
set nowrap                    " Do not wrap lines
set expandtab                 " Use spaces instead of tabs
set smarttab                  " Be smart when using tabs ;-)
set softtabstop=2             " 1 tab is 2 spaces
set shiftwidth=2
set tabstop=2
set foldmethod=indent         " Fold based on indentation.
set foldlevelstart=99         " Expand all folds by default.

autocmd BufWritePre <buffer> :%s/\s\+$//e " Strip whitespace from end of line

" Disable backup. No swap files.
set nobackup
set nowb
set noswapfile

" Bindings
nnoremap <LEADER>n :n .<CR>|"          Open the filer manager at the current working directory
nmap <LEADER>l :set list!<CR>|"        Toggle list characters (Invisibles)
map <LEADER>s :set spell!<CR>|"        Toggle spell
map <LEADER>F :AckFromSearch!<Space>|" Search visual selection
map <LEADER>f :Ack!<Space>|"           Search
map <LEADER><left> :bprev<CR>|"        Previous buffer
map <LEADER><right> :bnext<CR>|"       Next buffer

" Window
syntax enable       " Syntax highlighting
set hidden          " Allow hiding buffers with unsaved changes
set number          " Show line numbers
set ruler           " Show cursor position
set spelllang=en_au " Australian English

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " Where to save histories
set undolevels=1000         " How many undos
set undoreload=10000        " Number of lines to save

" File manager
let g:netrw_list_hide= '^\..*$' " Hide dotfiles
let g:netrw_banner=0            " Disable banner
let g:netrw_liststyle=3         " Tree

" Theme
colorscheme jellybeans

" GUI
if has("gui_running")
  set background=dark
  colorscheme solarized
  set guifont=Monaco:h13
  set guioptions=-t " Hide toolbar
  set guioptions=+c " Disable dialogues
endif

" MacVim
if has("gui_macvim")
  autocmd FocusLost * nested :silent! wall " Save all buffers when focus is lost
  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv
  " Command-T to CtrlP
  "macmenu &File.New\ Tab key=<nop>
  map <D-t> :CtrlP<CR>
else
  " Copy to OSX clipboard when not running Macvim
  vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
  nmap <C-v> :call setreg("\"",system("pbpaste"))<CR><CR>p
endif
