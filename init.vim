""" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdcommenter' " for better commenting
Plug '/usr/local/opt/fzf' " fzf - fuzzy finder
Plug 'junegunn/fzf.vim' " fzf - fuzzy finder
Plug 'tpope/vim-rails' " rails helpers for vim
Plug 'scrooloose/nerdtree' " NERDTree
Plug 'vim-ruby/vim-ruby' " Ruby helpers for vim
Plug 'pangloss/vim-javascript' " Javascript highlighting
Plug 'mxw/vim-jsx' " JSX highlighting
Plug 'tpope/vim-surround' " Surround
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'slim-template/vim-slim'
Plug 'vim-python/python-syntax'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'bling/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Themes
Plug 'ayu-theme/ayu-vim'
call plug#end()
""" Plugins end

""" COLOR SCHEME
"set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

set hidden
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

" set leader to space
:let mapleader=" "

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

""" FZF
nmap <leader>p :Files<cr>

""" NerdTree
nmap <leader>ne :NERDTree<cr>
nmap <leader>nf :NERDTreeFind<cr>


""" Aliases
cabbrev ag Ag
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save

""" Airline
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='deus'

""" Line numbering
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
"""

""" Folds
set foldmethod=syntax
set foldnestmax=20
set foldlevel=2
set foldlevelstart=20
"""

set encoding=utf8

""" COC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = ['coc-solargraph']

" Use <C-l> for trigger snippet expand.
imap <C-a> <Plug>(coc-snippets-expand)
""" End COC
