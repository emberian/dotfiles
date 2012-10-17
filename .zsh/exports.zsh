fpath=(~/.zsh/user-functions $fpath)

# Currently this path is appendend to dynamically when picking a ruby version
export PATH=~/.local/bin:$PATH

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

export CPATH=/usr/local/include:~/.local/include
