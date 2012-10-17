# I tried source ~/.zsh/*.zsh but that didn't work
for f in ~/.zsh/*.zsh; do
  source $f;
done

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
source /usr/bin/virtualenvwrapper.sh
