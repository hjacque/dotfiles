#!/bin/bash
re='^[0-9]$'; [[ $# -eq 1 ]] && [[ $1 =~ $re ]] || { echo "ERROR: expected - arg1: workspace id"; exit 1; }

i3-msg "workspace $1; append_layout ~/.config/i3/monitor-workspace.json"
gnome-terminal -- zsh -c "~/scripts/cron.sh neofetch 60; exec zsh;"
gnome-terminal -- zsh -c "htop; exec zsh"
gnome-terminal -- zsh -c "~/scripts/cron.sh ~/scripts/network-scan.sh 60; exec zsh;"
gnome-terminal --zoom=1.5 -- zsh -c "unimatrix --asynchronous --flashers --character-list=m --color=red; exec zsh"
