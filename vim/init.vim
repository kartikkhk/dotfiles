if filereadable(expand("~/.config/nvim/vimrc.bundles"))
  source ~/.config/nvim/vimrc.bundles
endif
set rtp^=/usr/share/vim/vimfiles/
syntax on
set completeopt=menuone,noinsert,noselect
set splitright
set splitbelow
set number
set relativenumber
set hlsearch
set incsearch
set magic
set smarttab
set autoindent
set smartindent
set autoread
set tabstop=4 softtabstop=4
set nowrap
set diffopt+=vertical
set hidden
set cmdheight=1
set scrolloff=10 "start scrolling down / up when you are 10 lines away
set shiftwidth=4
set nohlsearch "remove highlight from text after search 
set hidden "navigate away from buffers without saving them, takes a little bit more RAM but basically peanuts compared to VS code
set ignorecase "ignore case sensitivity while searching
set smartcase 
"set signcolumn=yes
set undofile
set undodir=~/.vim/undodir
set background=dark
set updatetime=750
colorscheme codedark

if has('mouse')
  set mouse=a
endif
if has('termguicolors')
  set termguicolors
endif

filetype plugin indent on

let mapleader=" " 
let g:netrw_banner=0 "remove banner from file explorer
let g:markdown_fenced_languages = ["javascript", "js=javascript", "json=javascript"] "syntax highlighting for code snippets and markdown files

" saves the buffer in insert mode
inoremap <C-s> <Esc>:w<cr>i
" saves the buffer in insert mode
nnoremap <C-s> <Esc>:w<cr>
" yanks to clipboard in visual mode
vnoremap <C-c> "+y

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

" auto pairing 
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" --- Plugin Configurations --- "

"scrooloose/nerdtree
map <leader>e :NERDTreeToggle<cr>

" lightline and vim-gitbranch
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component_function': {
      \   'helloworld': 'gitbranch#name'
      \ },
      \ }

" szw/vim-maximizer - to maximize the split
nnoremap <leader>m :MaximizerToggle! <CR>

" jeetsukumaran/vim-buffergator - For Lazy loading buffergator
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>

" kassio/neoterm - terminal for neovim
let g:neoterm_default_mod = 'belowright'
let g:neoterm_size = 11
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <C-t> :Ttoggle<CR>
tnoremap <C-t> <C-\><C-n>:Ttoggle<CR>

" machakann/vim-highlightedyank for highlighted yankiing
if !has('nvim')
  map y <Plug>(highlightedyank)
endif

" sbdchd/neoformat
nnoremap <leader>l :Neoformat prettier<CR> 

" commenting code: gc [in visual mode]

" junegunn/fzf.vim 
nnoremap <C-p> :GFiles <CR> 
" rip-grep needs to be installed via brew / apt-get for this to work
nnoremap <C-f> :Rg <CR>
" ensure fzf exit works with Esc
if has('nvim')
	au! TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
	au! FileType fzf tunmap <buffer> <Esc>
endif

" tpopt/vim-fugitive
" 's' to stage a file, see diff with '=' & 'cc' to commit
nnoremap <leader>gst :G<CR>

" neovim/nvim-lspconfig and nvim-lua/completion-nvim (for this to work ensure
" typescript language server is installed: 'npm install -g typescript-language-server -s')
" node-js tsserver - autocompletion (@todo fix this autocomplete isn't working)
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach } 
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>

" janko/vim-test
nnoremap <silent> tt :TestNearest<CR>
nnoremap <silent> tf :TestFile<CR>
nnoremap <silent> ts :TestSuite<CR>
nnoremap <silent> t_ :TestLast<CR>
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"

" puremourning/vimspector
" run :VimspectorInstall vscode-node-debug2 for nodejs debugging. 
" launch.json will be .vimspector.json 
nnoremap <leader>dl :call vimspector#Launch()<CR>
nnoremap <leader>dr :call vimspector#Reset()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drn :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>

" bling/vim-airline tabline settings
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#neomake#enabled = 0
