```
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback
auto wlp2s0
iface wlp2s0 inet static
address 192.168.0.100
gateway 192.168.0.1
netmask 255.255.255.0
dns-nameservers 8.8.8.8
```

and then 

```
sudo ip addr flush enp0s25
sudo systemctl restart networking.service
```

