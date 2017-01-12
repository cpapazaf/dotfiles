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

" Some settings to enable the theme:
set number        " Show line numbers
syntax enable     " Use syntax highlighting
set background=dark
" colorscheme solarized

" highlight line
set cursorline

" show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" show tabs
set list lcs=tab:\|-

" Use 4 spcaes instead of tabs
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set softtabstop=2

" All of your Plugins must be added before the following line
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

