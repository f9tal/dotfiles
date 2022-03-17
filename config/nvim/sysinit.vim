" /etc/xdg/nvim/sysinit.vim
" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

set clipboard=unnamed
set noswapfile
set relativenumber number
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set hlsearch
set confirm
set hidden
set shortmess-=S
set number

filetype plugin indent on                        " enable filetype detection
set listchars=eol:¶,trail:•,tab:▸\               " whitespace characters
set scrolloff=999                                " center cursor position vertically
set showbreak=¬\                                 " Wrapping character
set showmatch                                    " show matching brackets
syntax on                                        " enable syntax highlightning

set autoindent expandtab                         " autoindentation & tabbing
set shiftwidth=2 softtabstop=2 tabstop=2         " 1 tab = 2 spaces

set lazyredraw                                   " enable lazyredraw
set nocursorline                                 " disable cursorline
set ttyfast                                      " enable fast terminal connection

set nobackup noswapfile nowritebackup            " disable backup/swap files
set undofile undodir=~/.vim/undo undolevels=9999 " undo options

set hlsearch ignorecase incsearch smartcase      " search options
