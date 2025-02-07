check the internet connection in the service

```
#setup
#influxdb
wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.6.1-amd64.deb
sudo dpkg -i influxdb2-2.6.1-amd64.deb
wget https://dl.influxdata.com/influxdb/releases/influxdb2-client-2.6.1-amd64.deb
sudo dpkg -i influxdb2-client-2.6.1-amd64.deb

#grafana
sudo apt-get install -y adduser libfontconfig1 musl
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_11.5.1_amd64.deb
sudo dpkg -i grafana-enterprise_11.5.1_amd64.deb

```


```
# initial setting
sudo ./initial_setup.sh

# when modify service
sudo systemctl daemon-reload
sudo systemctl restart network_monitor.service
systemctl status network_monitor.service
```

