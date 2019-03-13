#!/bin/bash

mkdir -p $HOME/.vim/{autoload,bundle}
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/itchyny/lightline.vim $HOME/.vim/bundle/lightline.vim
mkdir $HOME/.vim/{bkup,tmp}
cp $HOME/projects/resources/dotfiles/vimrc $HOME/.vimrc
echo "done!"
