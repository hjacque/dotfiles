#!/bin/bash
[[ $# -eq 2 ]] || { echo "ERROR: expected - arg1: program, arg2: rate"; exit 1; }
while true; do clear; $1; read -t $2 -n 1 input; ! [[ $? = 0 ]] || ! [[ $input = "q" ]] || exit 1; done;
