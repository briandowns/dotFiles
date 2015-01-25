" Disable VI compatibility
set nocompatible

" Setup Vundle
"filetype off
if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif
set runtimepath+=~/.vim/bundle/vundle/
set runtimepath+=$GOPATH/src/github.com/golang/lint/misc/vim " Golang linting
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'armon/vimerl'
Bundle 'mileszs/ack.vim'
Bundle 'matchit.zip'
Bundle 'taglist.vim'
Bundle 'localvimrc'
Bundle 'python.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'Rip-Rip/clang_complete'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'LargeFile'
Bundle 'scrooloose/nerdcommenter'
Bundle "godlygeek/tabular"
Bundle 'tpope/vim-eunuch'
Bundle 'jsbeautify'
Bundle 'amadeus/powerline-improved'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-abolish'
Bundle "tpope/vim-markdown"
Bundle "jtratner/vim-flavored-markdown"
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'airblade/vim-gitgutter'
Bundle "pangloss/vim-javascript"
Bundle "fatih/vim-go"
Bundle "nsf/gocode"
Bundle "davidhalter/jedi-vim"
Bundle "nerdtree"
Bundle 'wting/rust.vim'
Bundle 'vim-jp/vim-go-extra'

" enable spelling set spell spelllang=en_us
" warning: variables will spell wrong
highlight SpellBad cterm=underline ctermfg=blue

set omnifunc=syntaxcomplete#Complete

filetype plugin indent on
let g:go_fmt_command = "goimports"

"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

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
syntax sync minlines=256
set synmaxcol=128

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" ==================== Vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt"


au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>t <Plug>(go-def-tab)

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap  <leader>r  <Plug>(go-run)
au FileType go nmap  <leader>b  <Plug>(go-build)

au FileType go nmap <Leader>d <Plug>(go-doc)

" scala settings
autocmd BufNewFile,BufReadPost *.scala setl shiftwidth=2 expandtab

" md settings
au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4

" Prettify json
com! JSONFormat %!python -m json.tool

" Wildmenu completion {{{
set wildmenu
" set wildmode=list:longest
set wildmode=list:full

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

" From http://vimcasts.org/episodes/tidying-whitespace/
" Preserves/Saves the state, executes a command, and returns to the saved state
" Modified from http://vimbits.com/bits/231
" Remove trailing whitespace on save
function! Preserve(command)
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Execute clear whitespace on save
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")

" Disable folding
set nofoldenable

" Disable soft tabbing for HTML/CSS/JS
au BufNewFile,BufRead *.html setl noexpandtab
au BufNewFile,BufRead *.css setl noexpandtab
au BufNewFile,BufRead *.js setl noexpandtab

" Detect the markdown type
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Detect the salt type
au BufNewFile,BufRead *.sls setl filetype=yaml

" Auto format go code
autocmd BufWritePre *.go Fmt
"autocmd FileType go autocmd BufWritePre <buffer> Fmt

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Causes split to make it below
set splitbelow

" Causes vsplit to split to the right
set splitright

" Nicer invisibles
set listchars=tab:›\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

" Setup a leader
let mapleader = ";"

" Fast saving
nmap <leader>w :w<cr>

" Splitting
nmap <leader>v :vsplit<cr>
nmap <leader>s :split<cr>

" Fullscreen
nmap <leader>f :set fu<cr>

" Disable Ex Mode
map Q <Nop>

" Remap jj to escape
inoremap jj <Esc>

" Allows %% to expand to the folder of the current file
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" General cursor moves in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o

" Use <leader> ss to re-run the syntax highlights
nnoremap <leader>ss :syntax sync fromstart<cr>:redraw!<cr>

" Configure syntastic
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['erlang', 'html'] }
let g:syntastic_javascript_jsl_conf = "-conf ~/.jslintrc"
let g:syntastic_always_populate_loc_list=1

" Set ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" Tlist configs
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1

" Disable auto-fold in Erlang
let g:erlangFoldSplitFunction = 0

" Set powerline to use fancy symbols, and custom theme
let g:Powerline_symbols = "fancy"
let g:Powerline_theme = "custom"
let g:Powerline_colorscheme = "custom"
" call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Setup ctrlp
let g:ctrlp_max_files = 10000
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>l :CtrlPLine<cr>
nmap <leader>d :bdelete<cr>

" Setup YCM
let g:ycm_key_detailed_diagnostics = '<leader>i'
let g:ycm_confirm_extra_conf = 0
let g:ycm_allow_changing_updatetime = 0
let g:ycm_max_diagnostics_to_display = 30

" Optimize file searching
let g:ctrlp_custom_ignore = '\\.vagrant\|\\.git\|\\.hg\|\\.svn\|env\|.beam\|ebin\|deps\|\\.eunit\|\\.pyc$\|\\.o$'
if has("unix")
    let g:ctrlp_user_command = {
                \   'fallback': 'find %s -type f | egrep -v ' . g:ctrlp_custom_ignore .' | head -' . g:ctrlp_max_files
                \ }
endif

let g:ctrlp_working_path_mode = 0 " Do not modify my path
let g:ctrlp_map = '<leader>t' " Just use leader-t
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'  " Put the cache in the vim folder
let g:ctrlp_jump_to_buffer = 1 " Do not jump to new tabs
map <leader>b :CtrlPBuffer<cr>

" Configure localvimrc
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

" Disable fancy shit for 'large' files
" that are > 50MB
let g:LargeFile = 50

" If we are in visual mode, we can use * to search for the selection
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Gist settings
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1

" Gitgutter
let g:gitgutter_highlights = 0
let g:gitgutter_all_on_focusgained = 0
nnoremap <silent> <leader>j :GitGutterNextHunk<cr>
nnoremap <silent> <leader>k :GitGutterPrevHunk<cr>

" Ocaml settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
