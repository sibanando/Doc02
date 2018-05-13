#!/usr/bin/bash
# Author - Satish Prajapati
#
# Script used to get the Health Check Status in CSV format
Path1=/var/Scripts/Logs

echo "Hostname," >/root/logs/`date | awk '{print $3"-"$2"-"$6}'`_`date +%H`hrs.Linux-Health-Check.csv

#for myIp in $(cat /root/Scripts/rsalst)
for myIp in $(cat /root/Scripts/phy-list-1)

do
HostName=`ssh $myIp cat /etc/hosts | grep -i BKP`


echo "$HostName, >> /root/logs/`date | awk '{print $3"-"$2"-"$6}'`_`date +%H`hrs.Linux-Health-Check.csv
        M2="-"
        DNS2="-"
        NTP2="-"
        SVC2="-"
done
