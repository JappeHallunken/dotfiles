#!/bin/bash
#
pfad="/home/jappe/dotfiles"

rsync -a /home/jappe/.config/bashconf/.bashrc.d/.custom $pfad/bash 
rsync -a /home/jappe/.config/nvim/lua/custom/* $pfad/nvim 
rsync -a /home/jappe/.config/sway/config $pfad/sway 
rsync -a /home/jappe/.config/waybar/* $pfad/waybar
