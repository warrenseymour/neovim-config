call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'mehlah/vim-li3'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'mhartington/deoplete-typescript'

Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" prevent generation of .swp and other gubbins
set nobackup
set nowritebackup
set noswapfile

" set the search scan to wrap lines
set wrapscan

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" allow backspacing over indent, eol, and the start of an insert
set backspace=2

" make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" drop a marker at the end of a change area (ie using 'cw') instead of
" deleting it
set cpoptions=Bces$
" show current command (leader key, etc) in lower right
set showcmd

" scroll when 4 lines from top or bottom
set scrolloff=4

" get rid of the characters in window separators
set fillchars=""

" represent tabs as 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" enable search highlighting
set hlsearch

" search for matches as we type
set incsearch

" show line numbers
set number

" show preview and help window at bottom
set splitbelow

"enable true colours in terminal
set termguicolors

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

colo lithium

" show/hide current line highlight
autocmd WinEnter * setlocal cursorline

" set leader to ,
let mapleader = ","

" jump to eol in insert mode with C-]
inoremap <C-]> <End>

" jump to current error with ,l
map <leader>l :ll<CR>
autocmd WinLeave * setlocal nocursorline

" airline
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1

" deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" disable scratch after selecting completion
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
