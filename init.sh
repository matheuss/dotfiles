#!/usr/bin/env bash

rm_link () {
  rm -rf ~/"$1"
  ln -s "$(pwd)/$1" ~/"$1"
}

rm_link .zshrc
rm_link .tmux.conf
rm_link .vimrc
rm_link .gitconfig
mkdir -p ~/.config
rm_link .config/nvim
