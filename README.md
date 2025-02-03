check the internet connection in the service

```
# initial setting
sudo ./initial_setup.sh

# when modify service
sudo systemctl daemon-reload
sudo systemctl restart network_check.service
systemctl status network_check.service
tail -f /var/log/network_check.log
```

```
# remove systemd files
sudo rm /usr/local/bin/network_check /etc/systemd/system/network_check.service
```
