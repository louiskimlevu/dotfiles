set tabstop=2 softtabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent
set exrc
"silent set guicursor
set number relativenumber
set timeoutlen=250
set hidden
set noerrorbells
set nowrap
set noswapfile nobackup undodir=~/.vim/undodir undofile
set incsearch
" keep cursor in the middle, other behaviour
set scrolloff=8
"set scrolloff=999
set noshowmode
set completeopt=menuone,noinsert,noselect
"set colorcolumn=80 textwidth=80
set signcolumn=yes
set updatetime=100
set smartcase ignorecase
" to show how many occurences of a search at bottom right
set shortmess-=S
set termguicolors
set clipboard=unnamed
" opens the new window to the right of the current window when using :vsplit
set spr
set autoread
set cursorline

syntax enable
syntax on
hi Comment gui=italic cterm=italic

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'psliwka/vim-smoothie'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'hashivim/vim-terraform'
Plug 'hashicorp/sentinel.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'https://github.com/tpope/vim-fugitive'
" nerdtree
Plug 'preservim/nerdtree' |
  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  \ Plug 'ryanoasis/vim-devicons' |
  \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Set VimDevIcons to load after these plugins!
" NERDTree | vim-airline | CtrlP | powerline | Denite | unite | lightline.vim | vim-startify | vimfiler | flagship

Plug 'gruvbox-community/gruvbox'
"Plug 'justinmk/vim-sneak'
call plug#end()

" gruvbox theme
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" space leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" PlugInstall
"nmap <Leader>pi :PlugInstall<CR>

" airline
let g:airline_theme='gruvbox'
" If you use vim-airline you need powerline fonts
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
" unicode symbols
"let g:airline_sympFols.colnr = ' ℅'
let g:airline_symbols.colnr = ' '
"let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' '
"let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.maxlinenr = ''

" Copy current path inside "*
"cp relative path  (src/foo.txt)
nnoremap <leader>p :let @*=expand("%")<CR>
"cp absolute path  (/something/src/foo.txt)
"nnoremap <leader>pp :let @*=expand("%:p")<CR>
"cp directory name (/something/src)
nnoremap <leader>P :let @*=expand("%:p:h")<CR>

"gitgutterhighlight! link SignColumn LineNr
let g:gitgutter_enabled = 1
autocmd ColorScheme * highlight! link SignColumn LineNr
highlight! link SignColumn LineNr
let g:gitgutter_set_sign_backgrounds = 0
let g:gitgutter_override_sign_column_highlight = 0
" disable default keys
let g:gitgutter_map_keys = 0
nmap <Leader>d <Plug>(GitGutterPreviewHunk)

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case-insensitive feature
nmap <Leader>s <Plug>(easymotion-bd-w)
nmap <Leader>S <Plug>(easymotion-bd-W)
nmap <Leader>a <Plug>(easymotion-s)
"nmap <Leader>j <Plug>(easymotion-bd-jk)
"nmap <Leader>sss <Plug>(easymotion-s2)
"nmap <Leader>sl <Plug>(easymotion-lineanywhere)

" fzf
" filenames
nmap <Leader>f :FZF<CR>'
nmap <Leader>h :History<CR>'
nmap <Leader>H :Buffer<CR>'
nmap <Leader>g :GitFiles<CR>'
nmap <Leader>G :GitFiles?<CR>'
"file content
nmap <Leader>r :BLines<CR>'
nmap <Leader>R :Rg<CR>'
"fuzzy cd
command! -bang -bar -nargs=? -complete=dir Cd
    \ call fzf#run(fzf#wrap(
    \ {'source': 'find '.( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" ) .' -type d',
    \ 'sink': 'cd'}))
noremap <leader>cd :Cd<CR>

" https: // github.com/junegunn/fzf/blob/master/doc/fzf.txt
" Default fzf layout
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Normal'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" Popup window(center of the screen)
let g:fzf_layout = {'window': {'width': 0.95, 'height': 0.6}}
" Enable per-command history
let g:fzf_history_dir = '~/.local/share/fzf-history'
" command! LS call fzf  # run(fzf#wrap({'source': 'ls'}))


" write/quit
nmap <Leader>w :w<CR>
nmap <Leader>W :wq!<CR>
nmap <Leader>q :q!<CR>

" close buffer,tab
nmap <Leader>c :bd<CR>
nmap <Leader>C :close<CR>

" move buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nmap <Leader><Tab> <C-^>

" insert lines below/above
nmap <Leader>o o <Esc>
nmap <Leader>O O <Esc>

" copy to systemclipboard
"map Y "*y<CR>

" disable arrow keys
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" terminal
let g:floaterm_keymap_toggle = '<C-S>'
let g:floaterm_width = 0.95
let g:floaterm_height = 0.95
let g:floaterm_title=''

" startify
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_files_number = 5
let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'
let g:startify_bookmarks = [{'v': '~/.vimrc'},{'z': '~/.zshrc'},{'t': '~/.tmux.conf'}]
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

"which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" NerdTree
map <C-n> :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
    :NERDTreeRefreshRoot
    :NERDTreeRefreshRoot
  endif
endfunction

" Coc settings
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" devicons
set encoding=UTF-8
" nerdtree git plugin
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1
