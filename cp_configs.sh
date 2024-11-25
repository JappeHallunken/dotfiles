#!/bin/bash

#set path
dotpath="$HOME/dotfiles"
cd "$dotpath"

## execute rsync
/usr/bin/rsync -a $HOME/.bashrc.d/custom "$dotpath/bash" && \
/usr/bin/rsync -a $HOME/.config/nvim/lua/* "$dotpath/nvim" && \
/usr/bin/rsync -a $HOME/.config/sway/config "$dotpath/sway" && \
/usr/bin/rsync -a $HOME/.config/waybar/* "$dotpath/waybar" && \
/usr/bin/rsync -a $HOME/.config/rofi/config.rasi "$dotpath/rofi" && \
/usr/bin/rsync -a $HOME/.swaylock/config "$dotpath/swaylock" && \
/usr/bin/rsync -a $HOME/.local/bin/waybar-timer.sh  "$dotpath/waybar-timer.sh" && \
/usr/bin/rsync -a $HOME/.config/foot/foot.ini "$dotpath/foot/" && \
/usr/bin/rsync -a $HOME/.config/swaynag/config "$dotpath/swaynag" && \
/usr/bin/rsync -a $HOME/.config/darkman/config.yaml "$dotpath/darkman" && \
/usr/bin/rsync -a /usr/share/dark-mode.d/* "$dotpath/darkman/" && \
/usr/bin/rsync -a /usr/share/light-mode.d/* "$dotpath/darkman/"


## exec git if rsync was succesful
if [ $? -eq 0 ]; then
    /usr/bin/git add .
    /usr/bin/git commit -m "update configs"
    /usr/bin/git push
else
    echo "An error occured, git was not executed!"
    exit 1
fi
