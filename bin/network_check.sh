#!/bin/bash

LOGFILE="/var/log/network_check.log"

while true; do
    if ping -c 1 -W 2 8.8.8.8 > /dev/null; then
        echo "$(date): Internet OK" >> "$LOGFILE"
    else
        echo "$(date): Internet DOWN" >> "$LOGFILE"
    fi
    sleep 5
done

