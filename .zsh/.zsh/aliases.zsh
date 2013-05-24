ls() /bin/ls -F --color=auto $*
alias l='ls'
alias hc=herbstclient

alias v='gvim --remote-silent'
alias cower='cower --color=always'

# Same as above, but in long listing format
ll() /usr/bin/ls -Fhkl --color=auto $*

git() hub $*

p() pacman $*
pi() p -S $*
pu() p -Syu $*
