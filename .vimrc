set tabstop=2 softtabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent
set exrc
" silent set guicursor
set number relativenumber
set timeoutlen=200
set hidden
set noerrorbells
set nowrap
set noswapfile nobackup undodir=~/.vim/undodir undofile
set incsearch
set scrolloff=8
"set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80 textwidth=80 colorcolumn=+1
silent set signcolumn=yes

syntax enable
syntax on

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
call plug#end()


" gruvbox theme
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark


" Insert mode: escape insert mode
imap jj <ESC>
" Normal mode: insert lines below/above
nmap oo o <Esc> k
nmap OO O <Esc> j
" Disabling arrow keys in vim
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" This is the default extra key bindings
" https: // github.com/junegunn/fzf/blob/master/doc/fzf.txt
" Default fzf layout
let g:fzf_colors = { 
  \ 'fg':         ['fg', 'Normal'],
  \ 'bg':         ['bg', 'Normal'],
  \ 'preview-bg': ['bg', 'NormalFloat'],
  \ 'hl':         ['fg', 'Comment'],
  \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':        ['fg', 'Statement'],
  \ 'info':       ['fg', 'PreProc'],
  \ 'border':     ['fg', 'CursorColumn'],
  \ 'prompt':     ['fg', 'Conditional'],
  \ 'pointer':    ['fg', 'Exception'],
  \ 'marker':     ['fg', 'Keyword'],
  \ 'spinner':    ['fg', 'Label'],
  \ 'header':     ['fg', 'Comment'] }

" Popup window(center of the screen)
let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.6}}


" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" command! LS call fzf  # run(fzf#wrap({'source': 'ls'}))
