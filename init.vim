""" COLOR SCHEME
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme yin

set termguicolors
syntax enable

set expandtab
set shiftwidth=2
set tabstop=2

set number
set showcmd
set nocompatible
filetype indent on
filetype on " Enable file detection
filetype plugin on " Enable file type specific plugins
set wildmenu
set lazyredraw
set ic
set incsearch
set hlsearch
set backspace=indent,eol,start

" set jk as escape
inoremap jk <esc>

:let mapleader=","

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

""" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" Exit from terminal mode
tnoremap jk  <C-\><C-n>

""" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ayu-theme/ayu-vim' " a beautiful theme

Plug 'scrooloose/nerdcommenter' " for better commenting
Plug '/usr/local/opt/fzf' " fzf - fuzzy finder
Plug 'junegunn/fzf.vim' " fzf - fuzzy finder
Plug 'tpope/vim-rails' " rails helpers for vim
Plug 'tpope/vim-fugitive' " git commands for vim
Plug 'scrooloose/nerdtree' " NERDTree
Plug 'vim-ruby/vim-ruby' " Ruby helpers for vim
Plug 'easymotion/vim-easymotion' " easy navigation through file
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'pangloss/vim-javascript' " Javascript highlighting
Plug 'ngmy/vim-rubocop' " Rubocop check
Plug 'mxw/vim-jsx' " JSX highlighting
Plug 'tpope/vim-surround' " Surround

call plug#end()
""" Plugins end


""" STATUS LINE
set laststatus=2
set statusline=
set statusline+=\ %l
set statusline+=\ %*
set statusline+=\ ‹‹
set statusline+=\ %f\ %*
set statusline+=\ ››
" set statusline+=\ %m
" set statusline+=\ %F
set statusline+=%=
set statusline+=\ ‹‹
set statusline+=\ %{strftime('%R',getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*

""" FZF
nmap <leader>p :Files<cr>

""" NerdTree
nmap <leader>ne :NERDTree<cr>

""" You Complete Me
" let g:ycm_python_binary_path = "/usr/bin/pythol"

""" Deoplete
let g:deoplete#enable_at_startup = 1


""" Aliases
cabbrev ag Ag

autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save
