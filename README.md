check the internet connection in the service

```
# initial setting
sudo ./initial_setup.sh

# when modify service
sudo systemctl daemon-reload
sudo systemctl restart network_monitor.service
systemctl status network_monitor.service
tail -f /var/log/network_monitor.log
```

```
# remove systemd files
sudo rm /usr/local/bin/network_monitor /etc/systemd/system/network_monitor.service /var/log/network_monitor.log
```
