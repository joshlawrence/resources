#!/bin/bash

if [ -d "$HOME/.vim" ]; then
    echo "found a ~/.vim dir, getting rid of it!"
    rm -rf "$HOME/.vim"
fi

# pathogen
mkdir -p $HOME/.vim/{autoload,bundle,mysnippets}
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# plugins
git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
git clone https://tpope.io/vim/sensible.git $HOME/.vim/bundle/sensible
git clone https://github.com/SirVer/ultisnips.git $HOME/.vim/bundle/ultisnips

touch "$HOME/.vim/mysnippets/all.snippets"

vim -u NONE -c "helptags sensible/doc" -c q
vim -u NONE -c "helptags ultisnips/doc" -c q

echo "done! don't forget to copy your vimrc."
