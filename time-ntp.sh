#!/bin/bash
for i in `cat prod-list`
do echo "----$i----"
ssh $i  timedatectl set-timezone Asia/Kolkata
/usr/sbin/ntpdate -u 172.23.224.100
done
