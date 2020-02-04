#!/usr/bin/env bash


bkp_and_link () {
  mv ~/"$1" ~/"$1.bkp"
  ln -s "$(pwd)/$1" ~/"$1"
}

bkp_and_link .zshrc
bkp_and_link .tmux.conf
bkp_and_link .vimrc
