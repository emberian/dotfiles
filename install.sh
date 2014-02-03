#!/bin/sh

old_dir=$HOME/.dotfiles_old

if [ ! -f $PWD/README ]; then
	echo "I couldn't find README. Did you run install.sh from the dotfiles
	directory?"
	exit 1;
fi

files_all=$PWD/*

for file in $files_all; do
	case "$file" in
		$PWD/README) ;;
	$PWD/install.sh) ;;
	*) files="$files $file" ;;
	esac
done

echo "Backing up existing dotfiles to $old_dir"

if [ -d $old_dir ]; then
	echo "ERROR: $old_dir already exists!"
	exit 1;
fi

mkdir $old_dir

for file in $files; do
	base=`basename $file`
	base=".$base"
	if [ -e $HOME/$base ]; then
		echo "Backing up $base"
		mv $HOME/$base $old_dir/$base
	fi
	echo "Installing link to $base"
	ln -s $file $HOME/$base
done
