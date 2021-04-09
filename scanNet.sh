#!/bin/bash

ipr=$( ip route | grep '^[0-9][0-9][0-9]' | awk '{print $1}' )

if [ $# -eq 0  ]; then
        nmap -sn $ipr -n |  grep '[0-9]$' | awk '{print $5}' 2>&1 | tee ipAddrs.txt
elif [ $1 = "help" ]; then
        echo "Usage:"
        echo "   ./scanNet help "
        echo "   to get this screen"
        echo
        echo " If you need to get all ip addr in private network"
        echo "   ./scanNet"
        echo
        echo " If you need to get new ip addr in private network"
        echo "   ./scanNet host.txt"
        echo
        echo "Important! Run it with sudo if you can, in order to get best results"
else
        nmap -sn $ipr --excludefile $1 -n | grep '[0-9]$' | awk '{print $5}' 2>&1 | tee ipAddrs.txt
fi
