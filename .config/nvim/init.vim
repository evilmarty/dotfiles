if &compatible
  set nocompatible               " Be iMproved
endif

filetype plugin indent on

call plug#begin(stdpath('data') . '/plugged')

Plug '/usr/local/opt/fzf/plugin/fzf.vim'
Plug 'junegunn/fzf.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'vito-c/jq.vim'
Plug 'elixir-editors/vim-elixir'

call plug#end()

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim > 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

" Theme
colorscheme jellybeans
let g:jellybeans_use_term_italics = 1
let g:jellybeans_use_lowcolor_black = 1
let g:jellybeans_overrides = {
\  'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': 'none' },
\}

" Window
syntax enable
set number          " Show line numbers
set relativenumber  " Show relative line numbers to current line
set ruler           " Show cursor position
set spelllang=en_au " Australian English

" Whitespace
set list                      " Show invisibles by default
set listchars=tab:▸\ ,trail:· " Show tabs, trailing whitespace and end of lines
" set nowrap                    " Do not wrap lines
set formatoptions=l
set lbr
set expandtab                 " Use spaces instead of tabs
set smarttab                  " Be smart when using tabs ;-)
set softtabstop=2             " 1 tab is 2 spaces
set shiftwidth=2
set tabstop=2
set scrolloff=3
set foldmethod=indent         " Fold based on indentation.
set foldlevelstart=99         " Expand all folds by default.
set noshowmode
" Open splits at right side (and below)
set splitright
set splitbelow

" Disable backup. No swap files.
set nobackup
set nowb
set noswapfile

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " Where to save histories
set undolevels=1000         " How many undos
set undoreload=10000        " Number of lines to save

" Misc
set bufhidden=hide         " Hide buffer when not in window
set browsedir=current      " Open the browser at the current working dir
set grepprg=rg\ --vimgrep  " Use ripgrep as grep
set rtp+=/usr/local/opt/fzf

" Bindings
nnoremap <LEADER>n :n .<CR>                          | " Open the filer manager at the current working directory
nnoremap <silent> <LEADER><left> :bprev<CR>          | " Previous buffer
nnoremap <silent> <LEADER><right> :bnext<CR>         | " Next buffer
nnoremap ,<space> :nohlsearch<CR>                    | " Clean up search
nnoremap <LEADER>e :e <C-R>=expand('%:p:h') . '/'<CR>| " Edit file in same directory
nnoremap <LEADER>S :%s/\<<C-r><C-w>\>/               | " Search for word under cursor and substitute
nnoremap <LEADER>s :Rg <C-r><C-w><CR>                | " Search for word under cursor
nnoremap <silent> <C-L> :ls<CR>                      | " List buffers
nnoremap <silent> <LEADER>w :bd<CR>                  | " Close current buffer
nnoremap <F12> :source $MYVIMRC<CR>                  | " F12 reloads the ~/.vimrc file
nnoremap <silent> <C-P> :Files<CR>                   | " Search files using fzf

" Move block text
vnoremap <silent> J :m '>+1gv=gv<CR>
vnoremap <silent> K :m '<-2gv=gv<CR>

" A trick for when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts).
" This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

" netrw config
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * if expand("%") == "" | :Vexplore | endif
" augroup END

" Terraform
let g:terraform_fmt_on_save = 1
" Fix up comments in Terraform files
autocmd FileType terraform setlocal commentstring=#%s
