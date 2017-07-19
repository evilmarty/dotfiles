if &compatible
  set nocompatible               " Be iMproved
endif

filetype plugin indent on

" Required:
set runtimepath^=~/.nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.nvim'))
  call dein#begin(expand('~/.nvim'))

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('mhartington/oceanic-next')
  call dein#add('fatih/vim-go')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('mileszs/ack.vim')
  call dein#add('hashivim/vim-terraform')

  call dein#end()
  call dein#save_state()
endif


" Ctrl-P: Exclude .git and files in .gitingore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim > 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" Theme
colorscheme OceanicNext
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'

" Window
syntax enable
set number          " Show line numbers
set relativenumber  " Show relative line numbers to current line
set ruler           " Show cursor position
set spelllang=en_au " Australian English

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

" Disable backup. No swap files.
set nobackup
set nowb
set noswapfile

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " Where to save histories
set undolevels=1000         " How many undos
set undoreload=10000        " Number of lines to save

" Disable mouse input
set mouse=

set bufhidden=hide

" Bindings
nnoremap <LEADER>n :n .<CR>|                           " Open the filer manager at the current working directory
nmap <LEADER>l :set list!<CR>|                         " Toggle list characters (Invisibles)
map <LEADER>S :set spell!<CR>|                         " Toggle spell
map <LEADER><left> :bprev<CR>|                         " Previous buffer
map <LEADER><right> :bnext<CR>|                        " Next buffer
nnoremap <LEADER>e :e <C-R>=expand('%:p:h') . '/'<CR>| " Edit file in same directory
nnoremap <LEADER>s :%s/\<<C-r><C-w>\>/|                " Search for word under cursor and substitute
nnoremap <LEADER>w /<C-r><C-w><CR>|                    " Search for word under cursor
nnoremap <LEADER><ESC> :nohlsearch<CR>|                " Clear search

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use the_silver_searcher
let g:ackprg = 'ag --vimgrep'
