" Corey Richardson
" Licensed under CC0

" No global message splash on start
set shortmess+=I
""" Global Things, should be set first
set nocompatible " Screw vi
filetype off
set modeline modelines=5 " I like modelines. They please me.
set laststatus=2
let g:Powerline_symbols = "unicode"

"VUNDLE
set rtp+=~/.vim/bundle/bundle/
call vundle#rc()
" TODO: make sure all the old plugins I manually installed are bundled instead
Bundle 'wavded/vim-stylus'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'othree/html5.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'tpope/vim-ragtag'
Bundle 'CSApprox'
Bundle 'LycosaExplorer'
Bundle 'pangloss/vim-javascript'
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'vim-scripts/taglist.vim'
Bundle 'pythoncomplete'
Bundle 'gotcha/vimpdb'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'tasklist.vim'
Bundle 'Rainbow Parenthesis'
Bundle 'wlangstroth/vim-racket'
Bundle 'TagHighlight'
Bundle 'baskerville/bubblegum'

" My leader is , NOT \
let maplocalleader = "," 
let g:maplocalleader = ","
let mapleader = "," 
let g:mapleader = ","

""" Random Misc
set history=500

""" See ~/.gvimrc for gui options

""" Filetypes on, as well as indentation and completion.
filetype plugin on
set ofu=syntaxcomplete#Complete
filetype indent on
autocmd BufNewFile,BufRead *.vb set ft=vbnet " Ensure VB code gets highlighted
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

""" UI Things
set so=4 " 4 lines above and below cursor before scrolling begins
set wildmenu " Visual feedback for completion
set ruler " Show current position in file in the statusline
set cmdheight=1 " One line buffer on the bottom
set hidden " Allows a buffer to go out of a window while unsaved
set number " Show line numbers on the sides
set virtualedit=all " Put cursor on imaginary characters
set nowrap " A good default
set noerrorbells " Don't annoy me with your stupid errors!
set novisualbell
set tm=500 " half a second to hit a key after leader
set showmatch " Show me matching braces etc

" Style to apply to current line the cursor is on
highlight CursorLine guibg=grey
" Highlight the line the cursor is on in insert mode
au InsertLeave * set nocursorline
au InsertEnter * set cursorline
set nolazyredraw " Don't redraw while executing macros -- saves proc time

""" Styles, colors, etc
syntax enable
colorscheme bubblegum
set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac " Default line endings

""" Insert mode
set backspace=eol,start,indent " Allow backspace to cross those boundaries
set whichwrap+=<,>,h,l " Allow those keys to change lines when hitting end
" Use tabs for indentation, space for alignment
set noexpandtab " Make tabs behave properly
set shiftwidth=4
set softtabstop=0
set tabstop=4
set smarttab
set tw=78 " A sane default
set autoindent " Indent for me as I enter a block
set smartindent " Be smart about it

""" Searching and stuff
set ignorecase " Ignore case while searching
set smartcase " Don't think this does anything with ignorecase, investigate later
set incsearch " Do a proper incremental search
set hlsearch " Highlight search results

""" Backups and undo
set undodir=~/.vim_runtime/undodir
set undofile

""" Keybindings

" Move left and right when nowrap
map <C-L> 5zl
map <C-H> 5zh
" Make numbers go away
map <silent> <leader># :set number! <CR>
" Pop a NERDTree
map <silent> <leader>f :execute "NERDTreeToggle" getcwd()<CR>
" Make highlights go away
map <silent> <leader>n :noh<CR>
" Edit the vimrc
map <leader>e :e! ~/.vimrc<CR>
" Spell check
map <leader>ss :setlocal spell!<CR>

""" Abbreviations and common fixes
iabbrev teh the

" MiniBufExpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows =1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let g:LycosaExplorerSuppressPythonWarning = 1

" Visible whitespace
set listchars=tab:>-,eol:$,trail:.,extends:#
