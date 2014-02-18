ls() /bin/ls -F --color=auto $*
alias l='ls'
alias hc=herbstclient

alias v='gvim --remote-silent'
# Same as above, but in long listing format
ll() /usr/bin/ls -Fhkl --color=auto $*

git() hub $*

p() yaourt $*
pi() p -S $*
pin() p -Si $*
pu() p -Syua $*
ps() p -Ss $*

ki() {
	make -j12
	sudo make modules_install
	sudo cp arch/x86/boot/bzImage /boot/vmlinuz-cmr-staging
}
