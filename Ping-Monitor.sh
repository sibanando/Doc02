#!/bin/bash
#
# Author - Satish Prajapati
# DXC Server Support Team
#
# Script used to check the Ping Status of the All UNIX Servers


counter=1

print_status()
{       echo "$counter  : $IP   $status "
}


for IP in $(cat /var/Scripts/allserver)

do
        /bin/ping $IP -c 3 > /dev/null 2>&1

        if [ $? -eq 0 ] ; then
                status="Alive"
        else
                status="Unreachable Please Check the Server"
        fi
        print_status $counter $IP $status
	print_status $counter $IP $status >> /var/Scripts/Logs/Ping-report.`date +%d%m%y_%H`
        counter=`expr $counter + 1`
done

