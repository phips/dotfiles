#!/bin/bash

function relink() {
    if [ -d $1 ]; then
        rm -rf $1
    elif [ -f $1 -o -L $1 ]; then
      rm $1
    fi
    ln -sn $2 $1
}

PROFILE=$1
DOTFILES=$(pwd)

cd ~

relink .ansible.cfg    $DOTFILES/default/ansible.cfg
relink .ansible        $DOTFILES/default/dotansible
relink .bash           $DOTFILES/default/bash
relink .bashrc         $DOTFILES/default/bashrc
relink .bash_profile   $DOTFILES/default/bash_profile
relink .bash_logout    $DOTFILES/default/bash_logout
relink .gemrc          $DOTFILES/default/gemrc
relink .gitconfig      $DOTFILES/default/gitconfig
relink .gvimrc         $DOTFILES/default/gvimrc
relink .irssi          $DOTFILES/default/dotirssi
relink .module-starter $DOTFILES/default/dotmodule-starter
relink .perltidyrc     $DOTFILES/default/perltidyrc
relink .perlcriticrc   $DOTFILES/default/perlcriticrc
relink .rpmmacros      $DOTFILES/default/dotrpmmacros
relink .s3curl         $DOTFILES/default/dots3curl
relink .screenrc       $DOTFILES/default/dotscreenrc
relink .ssh/config     $DOTFILES/default/ssh/config
relink .subversion     $DOTFILES/default/dotsubversion
relink vim             $DOTFILES/default/vim
relink .vim            $DOTFILES/default/dotvim
relink .vimrc          $DOTFILES/default/vimrc

if [ -n $PROFILE ]; then
    if [ ! -d "$DOTFILES/override/$PROFILE" ]; then
        echo "No $PROFILE directory!"
        exit 1
    fi

    SRC="$DOTFILES/override/$PROFILE"

    [ -f $SRC/ansible.cfg ]  && relink .ansible.cfg $SRC/ansible.cfg
    [ -d $SRC/local ]        && relink .bash/local  $SRC/local
    [ -f $SRC/dotcadaverrc ] && relink .cadaverrc   $SRC/dotcadaverrc
    [ -f $SRC/dotcurlrc ]    && relink .curlrc      $SRC/dotcurlrc
    [ -f $SRC/gitconfig ]    && relink .gitconfig   $SRC/gitconfig
    [ -f $SRC/dots3curl ]    && relink .s3curl      $SRC/dots3curl
    [ -f $SRC/screen2 ]      && relink .screen2     $SRC/screen2
    [ -f $SRC/ssh_config ]   && relink .ssh/config  $SRC/ssh_config
    [ -f $SRC/dotwgetrc ]    && relink .wgetrc      $SRC/dotwgetrc
fi
