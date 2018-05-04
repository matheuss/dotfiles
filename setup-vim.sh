mkdir tmp
cd tmp

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

sh ./installer.sh $HOME/.vim/bundle
