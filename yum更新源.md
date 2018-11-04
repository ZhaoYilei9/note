yum更新源

vi /etc/sysconfig/network-scripts/ifcfg-enp0s3

TYPE=Ethernet
IPADDR=192.168.0.101
NETMASK=255.255.255.0
DNS1=8.8.8.8
DNS2=8.8.4.4

service network restart