ls() /bin/ls -F --color=auto $*
alias l='ls'
alias hc=herbstclient

# Same as above, but in long listing format
ll() /usr/bin/ls -Fhkl --color=auto $*

git() hub $*

p() yaourt $*
pi() p -S $*
pu() p -Syua $*
ps() p -Ss $*
