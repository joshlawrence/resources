#!/usr/bin/env bash
# gitconfig.sh

# prompt the user for an email address
printf "%s\n" "Enter your email address and press [ENTER] "
read -rp "email: " my_email

# remove existing gitconfig
if [ -f "$HOME/.gitconfig" ]; then
    rm "$HOME/.gitconfig"
else
    echo "no ~/.gitconfig file found, proceeding..."
fi

git config --global user.name "Josh Lawrence"
git config --global user.email "$my_email"

# os-specific
if [[ $OSTYPE == darwin* ]]; then
    git config --global credential.helper osxkeychain
elif [[ $OSTYPE == linux-gnu* ]]; then
    git config --global credential.helper cache
fi

git config --global core.editor "nano -w"
git config --global core.autocrlf input
git config --global alias.fuckit "reset --hard"
git config --global push.default simple
git config --global pull.rebase true
#git config --global fetch.prune true
git config --global init.defaultBranch master

# create git commit.template
cat << EOF > "$HOME/.gitmessage.txt"
SUBJECT: 

The body of the commit message can be several paragraphs, and
please do proper word-wrap and keep columns shorter than about
74 characters or so. That way "git log" will show things
nicely even when it's indented.
EOF

git config --global commit.template "$HOME/.gitmessage.txt"

git config --global alias.yolo '!git commit -m "$(curl -s whatthecommit.com/index.txt)"'
