#!/bin/bash 
scripts=$(ls -L ~/scripts | grep sh); res=$(echo "$scripts" | rofi -dmenu -l 20)
gnome-terminal -- zsh -c "./scripts/$res; exec zsh; sleep 5"