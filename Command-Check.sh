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
for IP in `cat /var/Scripts/allserver`

do
	print_status $counter $IP  	
	print_status $counter $IP >>/var/Scripts/Logs/Command-Report.`date +%d%m%y_%H`
	counter=`expr $counter + 1` 
	ssh $IP $appl >>/var/Scripts/Logs/Command-Report.`date +%d%m%y_%H`
done

