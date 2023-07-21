#!/bin/bash
[[ $# -eq 2 ]] || { echo "ERROR: expect arg1: program - arg2: rate"; exit 1; }; while true; do clear; $1; sleep $2; done
