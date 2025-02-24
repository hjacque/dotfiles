#!/bin/sh
ip a | grep -o -m2 "[0-9]\+\.[0-9]\+\.[0-9]\.[0-9]\+/[0-9]\+" | tail -n1 | xargs -I '{}' nmap -sn '{}' | grep "Nmap scan report for " | sed 's|Nmap scan report for ||g'
