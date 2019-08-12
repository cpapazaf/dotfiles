set nocompatible              " be iMproved, requireD
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

" Some settings to enable the theme:
set number        " Show line numbers
syntax enable     " Use syntax highlighting
set background=dark

" highlight line
set cursorline

" show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" show tabs
set list lcs=tab:\|-

" Use 2 spcaes instead of tabs
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set softtabstop=2
" set the linter for python
let python_highlight_all=1

" NERDTree
autocmd StdinReadPre * let s:std_in=1
" - If no file passed
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" - If directory passed
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" - Close nerdtree if no file is opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ATTENTION: All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Change folders fast
"set hidden
"syntax enable
"source $VIMRUNTIME/menu.vim
"set wildmenu
"set cpo-=<
"set wcm=<C-Z>
"map <F4> :emenu <C-Z>
"nmap <Esc>[5D :bp<CR>
"nmap <Esc>Od  :bp<CR>
"nmap <Esc>OD  :bp<CR>
"nmap <Esc>[5C :bn<CR>
"nmap <Esc>Oc  :bn<CR>
"nmap <Esc>OC  :bn<CR>
"nmap <Esc>[3~ :bd<CR>
"nmap ZZ :bd<CR>

com! FJSON %!python -m json.tool
map <C-a> <esc>ggVG<CR>

" Open nerdtree map
map <C-m> :NERDTreeToggle<CR>

" Tabs left-right
map <C-b> :tabp<CR>
map <C-n> :tabn<CR>
