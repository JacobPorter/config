set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" class/method folding plugin
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf


au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Multi line auto indent
Plugin 'vim-scripts/indentpython.vim'

set encoding=utf-8

" Autocomplete
" Bundle 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete.vim'
" let g:neocomplete#enable_at_startup = 1
Plugin 'davidhalter/jedi-vim'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"	project_base_dir = os.environ['VIRTUAL_ENV']
"	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"	execfile(activate_this, dict(__file__=activate_this))
"EOF

" Work with anaconda environments
Plugin 'cjrh/vim-conda'

" You can have VIM check your syntax on each save with the syntastic extension
Plugin 'vim-syntastic/syntastic'

" Also add PEP 8 checking with this nifty little plugin
Plugin 'nvie/vim-flake8'

" Make code look pretty
let python_highlight_all=1
syntax on

" Color schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ajh17/Spacegray.vim'

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
set t_Co=256
set background=dark

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme spacegray
" colorscheme solarized

" Selects between color schemes.
"if has('gui_running')
"	set background=dark
"	colorscheme solarized
"else
"	colorscheme zenburn
"endif

" Switch between light and dark color schemes in solarized
call togglebg#map("<F5>")

" File browsing
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

" tabs
Plugin 'jistr/vim-nerdtree-tabs'

" Tags
Plugin 'majutsushi/tagbar'
Plugin 'szw/vim-tags'

map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" Search
Plugin 'kien/ctrlp.vim'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Line numbering
set nu

" Git integration
Plugin 'tpope/vim-fugitive'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2

Plugin 'Townk/vim-autoclose'

" Plugin 'vim-scripts/Conque-Shell'
Bundle 'wkentaro-archive/conque.vim'

Plugin 'vim-scripts/vim-auto-save'
" let g:auto_save_events = ["InsertLeave"] 
" CursorHold
" let g:auto_save_no_updatetime = 1 
" let g:auto_save = 1 
" set updatetime=5000
:nmap <C-w> :w<CR>
:imap <C-w> <Esc>:w<CR>a

" Mapping to go to the end of a file
inoremap <C-e> <C-o>g$
inoremap <C-a> <C-o>^

" Session management
" Plugin 'tpope/vim-obsession'
" Plugin 'dhruvasagar/vim-prosession'
Plugin 'mhinz/vim-startify'

" Turn on the mouse for resizing buffers, switching buffers, etc.
set mouse=n
