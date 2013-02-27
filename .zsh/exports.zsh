fpath=(~/.zsh/user-functions $fpath)

export PATH=~/.local/bin:~/.luarocks/bin:$PATH:/opt/android-sdk/tools

# Setup terminal, and turn on colors
export TERM=rxvt-256color
export CLICOLOR=1

# Enable color in grep
export GREP_OPTIONS='--color=auto'

export PAGER='less'
export EDITOR='vim'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C 

export MINICOM="-m -c on"

export CPATH=/usr/local/include
export GISTY_ACCESS_TOKEN=a3de9c2ce835785b6cbac0bfe4235d22354a4fa7
export GISTY_DIR=~/entropy/gists

export _JAVA_AWT_WM_NONREPARENTING=1

eval $(luarocks path)
