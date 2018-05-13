#!/bin/bash
for i in `cat phy-list-1`
do
ssh $i killall ntpd
ssh $i systemctl enable ntpd
ssh $i systemctl restart ntpd
ssh $i ntpdate -u 172.23.224.100
ssh $i ntpdate -q 172.23.224.100
ssh $i ntpdate 172.23.224.100
ssh $i systemctl restart ntpd
ssh $i timedatectl
done

