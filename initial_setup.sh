#!/bin/bash
sudo ln -s $(pwd)/bin/network_check.sh /usr/local/bin/network_check
sudo ln -s $(pwd)/systemd/network_check.service /etc/systemd/system/network_check.service
sudo systemctl daemon-reload
sudo systemctl enable network_check.service

