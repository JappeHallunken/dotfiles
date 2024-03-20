#!/bin/bash

#set path
dotpath="$HOME/dotfiles"
cd "$dotpath"

## execute rsync
/usr/bin/rsync -a $HOME/.bashrc.d/custom "$dotpath/bash" && \
/usr/bin/rsync -a $HOME/.config/nvim/lua/custom/* "$dotpath/nvim" && \
/usr/bin/rsync -a $HOME/.config/sway/config "$dotpath/sway" && \
/usr/bin/rsync -a $HOME/.config/waybar/* "$dotpath/waybar"
/usr/bin/rsync -a $HOME/.config/rofi/config.rasi "$dotpath/rofi"
/usr/bin/rsync -a $HOME/.swaylock/config "$dotpath/swaylock"

## exec git if rsync was succesful
if [ $? -eq 0 ]; then
    /usr/bin/git add .
    /usr/bin/git commit -m "update configs"
    /usr/bin/git push
else
    echo "An error occured, git was not executed!"
    exit 1
fi
