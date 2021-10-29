syntax on

set tabstop=2 softtabstop=2
set number
set smartindent 
"set mouse=a
set smartcase "search without worrying about case sensitivity
set noswapfile "no swap files in project 
set autoindent
set incsearch "while you search you actually get results
set nowrap
set background=dark
colorscheme hybrid
filetype indent plugin on

call plug#begin('~/.vim/plugged') "vim plugins 
Plug 'tpope/vim-fugitive' "look at git blames, diffs, logs etc.
Plug 'leafgarland/typescript-vim' "typescript inetegration, make typesript files colored, improved indenting etc.
Plug 'vim-utils/vim-man' "vim man pages
Plug 'lyuts/vim-rtags' "good for c++
Plug 'git@github.com:ctrlpvim/ctrlp.vim.git' "full path fuzzy finder for vim
Plug 'git@github.com:ycm-core/YouCompleteMe.git' "auto completing
Plug 'mbbill/undotree' "visualizes undo history and makes it easier to browse and switch between different undo branches.

call plug#end()

"allows to kind of detect your root, git root and .gitignore for faster searching
if executable('rg') 
		let g:rg_derive_root='true'
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"leader key is the key that you press to enter into your command mode
let mapleader = " "

"for file-tree
let g:netrw_rowse_split = 2
let g:netrw_banner = 0 "no extra help information
let g:netrw_winsize = 25 "window size should be 25%



