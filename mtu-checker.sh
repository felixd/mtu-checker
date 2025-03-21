#!/bin/bash
# Copyright (C) 2025 Paweł 'felixd' Wojciechowski 
# FlameIT - Immersion Cooling
# https://flameit.io
#
# USAGE: ./mtu-cheker.sh HOST
#
# Description: Simple script to check optimal MTU size (for site-to-site VPN tunnels for example)

if [ -z "$1" ]; then
    echo "Usage: $0 <host>"
    exit 1
fi

HOST=$1
MTU=1500
HEADER=28  # ICMP (8) + IP (20)
SIZE=$(($MTU - $HEADER))

while [ $SIZE -gt 0 ]; do
    echo -n "Checking MTU size $(($SIZE + $HEADER)): "

    ping -c 1 -M do -s $SIZE $HOST > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "Success"
        echo "Optimal MTU size: $(($SIZE + $HEADER))"
        exit 0
    else
        echo "Too large"
    fi

    SIZE=$(($SIZE - 8))
done

echo "Unable to determine optimal MTU size. Try manual check."
exit 1
