#!/bin/bash
sudo ln -s $(pwd)/bin/network_monitor.sh /usr/local/bin/network_monitor
sudo ln -s $(pwd)/systemd/network_monitor.service /etc/systemd/system/network_monitor.service
sudo ln -s $(pwd)/.env /usr/local/bin/.network_monitor.env
sudo systemctl daemon-reload
sudo systemctl enable network_monitor.service

