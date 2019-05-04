call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
call plug#end()

syntax on
set background=dark
colorscheme solarized
let g:gruvbox_contrast_dark = 'hard'

" Line numbers
set number
" no swap files
set noswapfile
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" ignore case sensitive searching
set ignorecase
set smartcase
" No annoying sound on errors
set noerrorbells
set novisualbell
" open splits to the right
set splitright
" Use spaces instead of tabs
set expandtab
" The number of spaces to use for each indent
set shiftwidth=2
" Be smart when using tabs
set smarttab
" Always show error gutter so it doesn't jump on lint
set signcolumn=yes
" Don't wrap lines
set nowrap
" Highlight search matches
set hlsearch
" Dont show the bottom status line
set laststatus=0
" no sign column gutter
set scl=no

" Map ; to fuzzy find
map ; :Files<CR>
map <C-o> :NERDTreeToggle<CR>
" Automatically indent pasted lines
nnoremap p p=`]
nnoremap P P=`]
" Mappings for moving lines and preserving indentation
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
