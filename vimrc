set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/Users/bdowns/.vim/bundle/Vundle.vim
set runtimepath+=$GOPATH/src/github.com/golang/lint/misc/vim " Golang linting
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-markdown'
Plugin 'fatih/vim-go'
Plugin 'buoto/gotests-vim'
Plugin 'nsf/gocode'
Plugin 'vim-jp/vim-go-extra'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jamessan/vim-gnupg'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'rust-lang/rust.vim'

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

set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

filetype plugin indent on

colorscheme molokai

set mouse=a

" 16 color terminal
set t_Co=256

" Set the term title
set title
set titlestring=%F

" Set encoding
set encoding=utf-8

" Show line number and position
set number
set ruler

" Leave 3 line buffer
set scrolloff=3
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom


" Enable syntax stuff
syntax on
filetype plugin indent on

" Show current mode
set showmode
set laststatus=2

" Fix backspace
set backspace=2

set lazyredraw

" speed up syntax highlighting
set nocursorcolumn
set nocursorline
set re=1
syntax sync minlines=256
set synmaxcol=128

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" Setup a leader
let mapleader = ";"

let NERDTreeShowHidden=1

autocmd BufEnter * lcd %:p:h
autocmd StdinReadPre * let g:isReadingFromStdin = 1
autocmd VimEnter * if !argc() && !exists('g:isReadingFromStdin') | NERDTree | endif

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" ==================== Vim-go ====================
let g:go_fmt_fail_silently = 0
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 0
let g:go_highlight_generate_tags = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalineter_enabled =         ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave =         1
let g:go_metalinter_deadline =         "5s"
let g:go_auto_type_info =              1

" au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>s  <Plug>(go-implements)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>in <Plug>(go-info)
au FileType go nmap <Leader>ii <Plug>(go-implements)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>g <Plug>(go-gbbuild)
au FileType go nmap <leader>t <Plug>(go-test-compile)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>s <Plug>(go-info)
au FileType go nmap <Leader>f  :GoImports<CR>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc,*.pyo                      " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Make Ctrl-T go to the next vim-tab
nmap <C-T> <ESC>:tabn<CR>

" Incremental search
set incsearch
set ignorecase

" Show matching braces, etc.
set showmatch

" Make it smart
set smartindent
set smarttab
set smartcase
set autoindent

" Default to soft tab
set expandtab

" Default to 2 spaces per tab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" More history
set history=1000

" Store our undo file
set undodir=~/.vim/undo
set undofile

" Make Taglist update more often
set updatetime=750

" Enable file backup (atomic)
set noswapfile
"set directory=~/.vim/swap,/tmp,.
set backupdir=~/.vim/backup,/tmp,.
set backup
set writebackup

" Scroll the view faster
noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

" Make our shell interactive.  Saving for now...
"set shellcmdflag=-ic

" Allow switching away from changed buffers
set hidden

" Prompts to save on quit
set confirm

" Splitting
nmap <leader>v :vsplit<cr>
nmap <leader>s :split<cr>

" Fast saving
nmap <leader>w :w<cr>

" Set ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Disable fancy shit for 'large' files
" that are > 50MB
let g:LargeFile = 50

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" ==================== GDB ==============================
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly

" ==================== YouCompleteMe ====================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" ==================== NerdTree ====================
" Open nerdtree in current dir, write our own custom function because
" NerdTreeToggle just sucks and doesn't work for buffers
function! g:NerdTreeFindToggle()
  if nerdtree#isTreeOpen()
    exec 'NERDTreeClose'
  else
    exec 'NERDTree'
  endif
endfunction

" Armor files
let g:GPGPreferArmor=1
" Set the default option
"let g:GPGDefaultRecipients=["la@la.com"]

augroup GPG
    autocmd!
    autocmd FileType gpg setlocal updatetime=12000
    autocmd CursorHold *.\(gpg\|asc\|pgp\) quit
augroup END

