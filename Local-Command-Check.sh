#!/bin/bash
#
# Author - Satish Prajapati 
#  HP Server Support Team
# 
counter=1

print_status()
{   	echo "$counter  : $IP   $status "
}

echo "Please Enter Unix Command to run on all Linux/UNIX server(Press Enter once Done) : "; read appl
for IP in `cat /var/Scripts/bkp.lst`

do
	print_status $counter $IP  	
	print_status $counter $IP >>/var/Scripts/Logs/Local-Command-Report.`date +%d%m%y_%H`
	counter=`expr $counter + 1` 
	$appl $IP |grep -i Name >>/var/Scripts/Logs/Local-Command-Report.`date +%d%m%y_%H`
done

