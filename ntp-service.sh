#!/bin/bash
for i in `cat phy-list-2`
do
#HostName=`ssh $i /usr/bin/hostname`
#Date=`ssh $i date`
#Time=`$i timedatectl`
ssh $i killall ntpd
ssh $i ps -ef | grep -i ntpd >> /root/logs/ntp-process.log
ssh $i systemctl enable ntpd
ssh $i systemctl restart ntpd
ssh $i ntpdate -q 172.23.224.100
ssh $i ntpdate 172.23.224.100
ssh $i systemctl restart ntpd
ssh $i systemctl status ntpd
ssh $i ntpdate -u 172.23.224.100
ssh $i timedatectl
#echo "$HostName, $Date" >> /root/logs/ntp-service.log
done
