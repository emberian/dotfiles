#!/bin/sh

old_dir=$HOME/.dotfiles_old

if [ ! -f $PWD/README ]; then
	echo "I couldn't find README. Did you run install.sh from the dotfiles
	directory?"
	exit 1
fi

files_all=$PWD/*
files_config=$PWD/config/*

for file in $files_all; do
	case "$file" in
		$PWD/README) ;;
		$PWD/install.sh) ;;
		$PWD/config*) ;;
		*) files="$files $file" ;;
	esac
done

echo "Backing up existing dotfiles to $old_dir"

if [ -d $old_dir ]; then
	echo "ERROR: $old_dir already exists!"
	exit 1
fi

mkdir $old_dir
mkdir $old_dir/.config

for file in $files; do
	base=`basename $file`
	base=".$base"
	if [ -e $HOME/$base ]; then
		if [ -L $HOME/$base ]; then
			if [ `readlink $HOME/$base` = $file ]; then
				echo "Ignoring existing dotfile $base"
				continue
			fi
		fi
		echo "Backing up $base"
	    mv $HOME/$base $old_dir/$base
	fi
	echo "Installing link to $base"
	ln -s $file $HOME/$base
done

if [ ! -d $HOME/.config ]; then
	mkdir $HOME/.config
fi

for file in $files_config; do
	base=`basename $file`
	base=".config/$base"
	if [ -e $HOME/$base ]; then
		if [ -L $HOME/$base ]; then
			if [ `readlink $HOME/$base` = $file ]; then
				echo "Ignoring existing dotfile $base"
				continue
			fi
		fi
		echo "Backing up $base"
		mv $HOME/$base $old_dir/$base
	fi
	echo "Installing link to $base"
	ln -s $file $HOME/$base
done

if [ -d $HOME/.vim/bundle/vundle ]; then
	exit 0
fi

wgit=`which git`
wvim=`which vim`

if [ -z $wvim ]; then
	echo "Vim not found in PATH; not boostrapping vundle"
	exit 0
fi

if [ -z $wgit ]; then
	echo "Git not found in PATH; not bootstrapping vundle"
	exit 0
fi

echo "Bootstrapping vundle to $HOME/.vim"

mkdir -p $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
