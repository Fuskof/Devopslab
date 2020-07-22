#!/bin/bash
# note: run as root
# add 8.8.8.8 to /etc/resolv.conf
sed -e "s/nameserver 8.8.8.8//" /etc/resolv.conf | uniq > /etc/resolv.conf.2
echo "nameserver 8.8.8.8" >> /etc/resolv.conf.2
mv -f /etc/resolv.conf.2 /etc/resolv.conf
echo""
echo "Current /etc/resolv.conf contains:"
cat /etc/resolv.conf | grep -v "#"
chattr +i /etc/resolv.conf
yum update