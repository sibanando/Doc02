#!/bin/bash
for i in `cat prod-lst`
do
echo "----$i----"
ssh $i cp /etc/ntp/step-tickers /etc/ntp/step-tickers.org
scp step-tickers root@$i:/etc/ntp/
ssh $i systemctl  stop ntpd 
ssh $i systemctl restart ntpdate.service
ssh $i systemctl enable ntpdate.service
ssh $i ntpdate -u 172.23.224.100
ssh $i systemctl restart ntpd
ssh $i timedatectl
done
