#!/bin/bash
re='^[0-9]$'; [[ $# -eq 1 ]] && [[ $1 =~ $re ]] || { echo "ERROR: expected - arg1: workspace id"; exit 1; }

i3-msg "workspace $1; append_layout ~/.config/i3/monitor-workspace.json"
gnome-terminal -- zsh -c "~/scripts/cron.sh neofetch 60; exec zsh;"
gnome-terminal -- zsh -c "htop; exec zsh"
gnome-terminal -- zsh -c "cmatrix; exec zsh"
