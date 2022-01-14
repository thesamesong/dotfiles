" ============================
"  Plugins
" ============================

call plug#begin('~/.vim/plugged')

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mhinz/vim-startify'

" brew install fzf
" brew install the_silver_searcher
" sudo apt-get install fzf
" sudo apt-get install silversearcher-ag

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

Plug 'posva/vim-vue'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-surround'

Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
call plug#end()

" ============================
"  Environment
" ============================

filetype plugin indent on

set autoread                    " Watch for file changes
set autowrite                   " Automatically :write before running commands
set noswapfile                  " Don't create/use swap file
set nobackup                    " Don't keep a backup file
set encoding=utf-8              " Sets default encoding
set fileformats=unix,dos        " Determines line endings (dos, unix or mac)
set fileencodings=utf-8,cp1251  " Lets open files in these encodings
set lazyredraw                  " Will buffer screen updates instead of updating all the time
set path=.,,**                  " List of directories which will be searched when using :find, gf, etc.
set wildmenu                    " Enables wildmenu (helpful for autocomplete in command mode)
set wildmode=list:longest,full  " Tab will complete to first full match and open the wildmenu
set wildignore+=.DS_Store
set hidden                      " Edit several files in the same time without having to save them
set wrap                        " Wrap long lines
set linebreak                   " Don't break words when wrapping
set history=500                 " Store lots of history entries: :cmdline and search patterns
set shiftround                  " When at 3 spaces and I hit >>, go to 4, not 5
set scrolloff=7                 " Min number of lines that you would like above and below the cursor
set number                      " Shows line numbers
set relativenumber
set cursorline

filetype plugin indent on

" You can exit Vim, reboot your computer and still undo changes you made.
" Vim inself doesn't create directory by given path (so, you need to create it before usage)
set undodir=~/.vim/undo-dir
set undofile

set timeoutlen=1000
set ttimeoutlen=0               " Eliminating delays on <Esc>

" set viminfo+=!                  " Use ~/.viminfo to memorize previous sessions (plug vim-startify require it)

" Search
set incsearch                   " While typing a search command, show pattern matches as it is typed
set hlsearch                    " Highlights search results (type :noh to temporarily hide it)
set ignorecase                  " Ignore case in search patterns
set smartcase                   " Override the 'ignorecase' if the search pattern contains upper case characters

" Show ↪ at the beginning of wrapped lines
if has("linebreak")
    let &sbr = nr2char(8618).' '
endif
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set list                        " Display invisible character

" Vim > 7.3 features
if v:version > 703
    set wildignorecase
endif

" Code style
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set autoindent

" Theme
set t_Co=256
syntax enable
set termguicolors
colorscheme mountaineer

" ==== Theme customization =================================================================

highlight LineNr guibg=NONE guifg=grey
highlight Visual guibg=grey guifg=black
highlight NonText guibg=NONE guifg=grey
"highlight CursorLine guibg=grey guifg=black
highlight CursorLineNr guibg=grey guifg=black

" ==== Airline Plugin / Status line =========================================================
set showcmd                                            " Display incomplete commands
set laststatus=2                                       " Always display the status line
let g:airline_theme = 'minimalist'                     " Change theme of airline (requires: vim-airline-themes)
let g:airline#extensions#branch#enabled  = 1           " Shows current git branch name (requires: vim-fugitive)
let g:airline#extensions#tabline#enabled = 1           " Use arline for tabline
let g:airline#extensions#tabline#show_buffers = 0      " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#tab_nr_type = 1       " tab number
let g:airline#extensions#tabline#show_close_button = 0 " remove x button
let g:airline#extensions#tabline#tabs_label = ''       " remove tabs label
let g:airline#extensions#tabline#show_splits = 0       " remove current tab from right
let g:airline_section_z = '%l/%L:%3c'
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" NERDTree Plugin
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowLineNumbers=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.DS_Store']

" Startify
let g:startify_custom_header = ['    Do what you can, with what you have, where you are.    ']

" Fzf
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--hidden --unrestricted --ignore-dir .git', fzf#vim#with_preview(), <bang>0)

" Ale
let g:ale_linters = {
    \   'python': ['flake8'],
    \}
"    \   'html': ['htmlhint'],
"    \   'python': ['flake8', 'pylint', 'pyright'],

" IndentLine
let g:indentLine_fileTypeExclude = ['json']


" ============================
" Keymaps
" ============================

nmap <Space> :NERDTreeToggle<CR>
nmap f<Space> :NERDTreeFind<CR>

"" Don't use Ex mode
map Q <Nop>
