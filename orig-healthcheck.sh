#!/usr/bin/bash
# Author - Satish Prajapati 
#
# Script used to get the Health Check Status in CSV format 
Path1=/var/Scripts/Logs

#echo "Mgmt IP, Hostname, Date, Production Network, Network Info, SwapSize, FS Configuration" >/var/Scripts/Logs/Linux-Health-Check.csv
echo "Mgmt IP, Hostname, Date, Production Network, Network Info, SwapSize, FS Configuration" >/var/Scripts/Logs/`date | awk '{print $3"-"$2"-"$6}'`_`date +%H`hrs.Linux-Health-Check.csv

for myIp in $(cat /var/Scripts/rsalst)
 
do
HostName=`ssh $myIp /usr/bin/hostname` 
ProdNet=`ssh $myIp hostname -i` 
NetInfo=`ssh $myIp  ip r l |grep -e default -e src -e via`
SwapPer=`ssh $myIp free -gt | grep Swap | awk '{print $2}'` 
Date=`ssh $myIp date`

ssh $myIp df -Th | awk '{if (NF==1) {line=$0;getline;sub(" *"," ");print line$0} else {print}}' | awk '{print $3" "$7}' >/tmp/DiskUsage 
	for M1 in `cat /tmp/DiskUsage`
	do
	M2="$M2 $M1-"
done
#echo "$myIp,$HostName, $Date, $ProdNet,$NetInfo,$SSwapPer, $M2" >> /var/Scripts/Logs/Linux-Health-Check.csv
echo "$myIp,$HostName, $Date, $ProdNet,$NetInfo,$SSwapPer, $M2" >> /var/Scripts/Logs/`date | awk '{print $3"-"$2"-"$6}'`_`date +%H`hrs.Linux-Health-Check.csv
	M2=""
done

	done

