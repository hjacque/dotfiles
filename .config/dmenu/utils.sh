#! /bin/bash 
scripts=$(ls -L ~/scripts | grep sh)
res=$(echo "$scripts" | dmenu -l 15) 
if [ i-z $res ]
then        
  echo "No Action"
else         
xdotool type "sh ~/scripts/$res"
fi