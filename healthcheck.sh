#!/usr/bin/bash
# Author - Satish Prajapati 
#
# Script used to get the Health Check Status in CSV format 
Path1=/var/Scripts/Logs

echo "Mgmt IP, Hostname, Date, Production Network, Network Info, SwapSize, FS Configuration, DNS, NTP, Services" >/var/Scripts/Logs/`date | awk '{print $3"-"$2"-"$6}'`_`date +%H`hrs.Linux-Health-Check.csv

#for myIp in $(cat /var/Scripts/rsalst)
for myIp in $(cat /var/Scripts/allserver)
 
do
HostName=`ssh $myIp /usr/bin/hostname` 
ProdNet=`ssh $myIp hostname -i` 
NetInfo=`ssh $myIp  ip r l |grep -e default`
SwapPer=`ssh $myIp free -gt | grep Swap | awk '{print $2}'` 
Date=`ssh $myIp date`

ssh $myIp df -Th | awk '{if (NF==1) {line=$0;getline;sub(" *"," ");print line$0} else {print}}' | awk '{print $3" "$7}' >/tmp/DiskUsage 
	for M1 in `cat /tmp/DiskUsage`
	do
	M2="$M1 $M2 -"
	done

ssh $myIp cat /etc/resolv.conf >/tmp/dns
	for DNS1 in `cat /tmp/dns`
	do
	DNS2="$DNS2 $DNS1 -"
	done

ssh  $myIp cat /etc/ntp.conf |grep -i server |grep -v ^# >/tmp/ntp
	for NTP1 in `cat /tmp/ntp`
	do
	NTP2="$NTP2 $NTP1 -"
	done

ssh $myIp systemctl list-unit-files |grep -e firewalld -e iptables -e NetworkManager >/tmp/svc
	for SVC1 in `cat /tmp/svc`
        do
        SVC2="$SVC1 $SVC2 -"
        done


echo "$myIp, $HostName, $Date, $ProdNet, $NetInfo, $SwapPer, $M2, $DNS2, $NTP2, $SVC2" >> /var/Scripts/Logs/`date | awk '{print $3"-"$2"-"$6}'`_`date +%H`hrs.Linux-Health-Check.csv
	M2="-"
	DNS2="-"
	NTP2="-"
	SVC2="-"
done


