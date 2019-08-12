set nocompatible              " be iMproved, requireD
filetype off                  " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine'
Bundle 'scrooloose/syntastic'
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Do not attach to the maps below cause they will trigger the twice with the targets specified 
"" Ctrl+I = Tab
"" Ctrl+J = Newline
"" Ctrl+M = Enter
"" Ctrl+[ = Escape

com! FJSON %!python -m json.tool
map <C-a> <esc>ggVG<CR>

" Open nerdtree map
map <C-t> :NERDTreeToggle<CR>

" Tabs left-right
map <C-b> :tabp<CR>
map <C-n> :tabn<CR>

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

