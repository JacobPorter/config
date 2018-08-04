set nocompatible              " required
filetype off                  " required
set backspace=indent,eol,start
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'powerline/powerline-fonts'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" set ambiwidth=double

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


"au BufNewFile,BufRead *.py
"    \ set tabstop=4 |
"    \ set softtabstop=4 |
"    \ set shiftwidth=4 |
"    \ set textwidth=79 |
"    \ set expandtab |
"    \ set autoindent |
"    \ set fileformat=unix |

" Multi line auto indent. Python mode has this.
" Plugin 'vim-scripts/indentpython.vim'

set encoding=utf-8
set fileencoding=utf-8
" scriptencoding utf-8

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
" syntastic is very slow with pylint.  Use python-mode or ALE (ALE uses VIM 8)
"Plugin 'vim-syntastic/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ALE (Asynchronous Lint Engine)  lints while you type (syntax checking, etc.)
" I think this needs linters installed.
" Requires Vim 8 or NeoVim
" Plugin 'w0rp/ale'

" Also add PEP 8 checking with this nifty little plugin
" Plugin 'nvie/vim-flake8'

" Enhanced syntax highlighting
" Plugin 'hdima/python-syntax'

" Make code look pretty
let python_highlight_all=1
syntax on

" Color schemes
" Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'ajh17/Spacegray.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'sjl/badwolf'

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
set t_Co=256
set background=dark

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme jellybeans
" colorscheme solarized

" Selects between color schemes.
"if has('gui_running')
"	set background=dark
"	colorscheme solarized
"else
"	colorscheme zenburn
"endif

" Switch between light and dark color schemes in solarized
" call togglebg#map("<F5>")

" File browsing
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

" tabs
Plugin 'jistr/vim-nerdtree-tabs'

" Tags
" Needs sudo apt-get install exuberant-ctags (or ctags for other distros.)
Plugin 'majutsushi/tagbar'
Plugin 'szw/vim-tags'

map <F5> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

" Search
Plugin 'kien/ctrlp.vim'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Line numbering
set nu

" Git integration
Plugin 'tpope/vim-fugitive'

Plugin 'itchyny/lightline.vim'
set laststatus=2
set noshowmode

let g:lightline = {
  \   'colorscheme': 'jellybeans',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]],
  \     'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ]]
  \   },
  \   'component': {
  \     'charvaluehex': '0x%2B',
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   },
  \ }
let g:lightline.separator = {
 	\   'left': '', 'right': ''
 \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}

" let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
" let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }

"      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
"     \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },


"let g:lightline.tabline = {
"  \   'left': [ ['tabs'] ],
"  \   'right': [ ['close'] ]
"  \ }
set showtabline=2

Plugin 'mgee/lightline-bufferline'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
" set guioptions-=e
nnoremap <F7> :bnext<CR>
nnoremap <F6> :bprev<CR>
" Autoclose brackets, parens, etc.
Plugin 'Townk/vim-autoclose'

" Plugin 'vim-scripts/Conque-Shell'
Bundle 'wkentaro-archive/conque.vim'

"Plugin 'vim-scripts/vim-auto-save'
"let g:auto_save_events = ["InsertLeave"] 
" CursorHold
"let g:auto_save_no_updatetime = 0
"let g:auto_save = 1
"let g:auto_save_silent = 1
"set updatetime=5000

" Save with <Ctrl-W> and go back th insert mode.
:nmap <C-w> :w<CR>
:imap <C-w> <Esc>:w<CR>a

" Mapping to go to the end of a line and beginning of a line
inoremap <C-e> <C-o>g$
inoremap <C-a> <C-o>^

" Session management
" Plugin 'tpope/vim-obsession'
" Plugin 'dhruvasagar/vim-prosession'
" Plugin 'mhinz/vim-startify'

" Turn on the mouse for resizing buffers, switching buffers, etc.
set mouse=n

" Nerd commenter uses left justification.
let g:NERDDefaultAlign = 'left'

" Map jj to the escape key.  Type jj fast to activate normal mode
Plugin 'zhou13/vim-easyescape'
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
" let g:easyescape_timeout = 2000
cnoremap jk <ESC>
cnoremap kj <ESC>

" :imap jj <Esc>

" Syntax checking, highlighting, etc. for Python
" Rope autocomplete, etc. needs the .ropeproject directory
Plugin 'python-mode/python-mode'
let g:pymode_lint_cwindow = 1
"let g:pymode_lint_checkers = []

let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'mccabe', 'pep8', 'pep257']
let g:pymode_lint_ignore = ["D212", "D400", "D203", "D205"]
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_lint_signs = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_error_symbol = '>>'
let g:pymode_lint_unmodified = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 4

" Supertab for auto complete
Plugin 'ervandew/supertab'

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme='jellybeans'
"let g:airline#extensions#tabline#enabled = 1
"
" Surrounds selected text with brackets
Plugin 'tpope/vim-surround'
" Run commands from VIM
Plugin 'tpope/vim-eunuch'
" Surround with multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Fuzzy matching
Plugin 'junegunn/fzf.vim'
" Buffer tabs
" Plugin 'ap/vim-buftabline'
" Plugin 'zefei/vim-wintabs'

" Side bar indicating lines that have changed from git
Plugin 'airblade/vim-gitgutter'

" Clutter free writing surface
Plugin 'junegunn/goyo.vim'

"Indent guides.
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1

" Font
"set guifont=Source\ Code\ Pro\ for\ Powerline:h16 
"set guifont=Meslo\ for\ Powerline
