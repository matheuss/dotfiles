#!/usr/bin/env bash

rm_link () {
  rm ~/"$1"
  ln -s "$(pwd)/$1" ~/"$1"
}

rm_link .zshrc
rm_link .tmux.conf
rm_link .vimrc
rm_link .gitconfig
mkdir ~/.config
rm_link .config/nvim
