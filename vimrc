" Corey Richardson
" Licensed under CC0

" No global message splash on start
set shortmess+=I
""" Global Things, should be set first
set nocompatible
let g:vundle_default_git_proto = 'git'

" Otherwise it tries to use your login shell, which is no bueno with fish.
set shell=/bin/sh

filetype off
set modeline modelines=5 " I like modelines. They please me.
set background=dark
set laststatus=2

"VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'CSApprox'
Plugin 'baskerville/bubblegum'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'tikhomirov/vim-glsl'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-surround'
Plugin 'the-lambda-church/coquille'
Plugin 'def-lkb/vimbufsync'
Plugin 'rust-lang/rust.vim'

call vundle#end()

" My leader is , NOT \
let maplocalleader = ","
let g:maplocalleader = ","
let mapleader = ","
let g:mapleader = ","
let g:gitgutter_max_signs=100000

""" Random Misc
set history=500

""" See ~/.gvimrc for gui options

""" Filetypes on, as well as indentation and completion.
filetype plugin on
filetype indent on
autocmd BufNewFile,BufRead *.vb set ft=vbnet " Ensure VB code gets highlighted
autocmd BufNewFile,BufRead *.ll set ft=llvm
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.html set sw=2
autocmd BufNewFile,BufRead *.css set sw=2
autocmd BufNewFile,BufRead *.v CoqLaunch

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

""" Styles, colors, etc
syntax enable
colorscheme bubblegum-256-dark

set encoding=utf8
try " try for machines where locales are broken
    lang en_US
catch
endtry

" Style to apply to current line the cursor is on
highlight CursorLine guibg=grey
" Highlight the line the cursor is on in insert mode
au InsertLeave * set nocursorline
au InsertEnter * set cursorline
set nolazyredraw " *do* redraw while executing macros -- some plugin now or in
                 " the past had glitches with lazyredraw...

set ffs=unix,dos,mac " Default line endings

""" Insert mode
set backspace=eol,start,indent " Allow backspace to cross those boundaries
set whichwrap+=<,>,h,l " Allow those keys to change lines when hitting end
set et
set shiftwidth=4
set tabstop=4
set smarttab
set tw=78 " A sane default
set autoindent " Indent for me as I enter a block
set smartindent " Be smart about it

""" Searching and stuff
set ignorecase " Ignore case while searching
set smartcase " But if I have an uppercase letter in the search, make it case sensitive
set incsearch " Do a proper incremental search
set hlsearch " Highlight search results

""" Backups and undo
set undodir=~/.vim_runtime/undodir
set undofile

""" Keybindings

" Move left and right when nowrap
map <C-L> 10zl
map <C-H> 10zh

""" Abbreviations and common fixes
iabbrev teh the
iabbrev functino function

" Visible whitespace (for list)
set listchars=tab:>-,eol:$,trail:.,extends:#

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
