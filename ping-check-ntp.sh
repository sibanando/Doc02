#!/bin/bash
#for i in `cat ntp-list`
#do echo "----$i----"; ssh $i ping  -c 3 172.23.224.100 >> /root/logs/ping-ntp.log 
#done

counter=1

print_status()
{       echo "$counter  : $IP   $status "
}


for i in $(cat /root/Scripts/ntp-list)

do
        ssh $i ping 172.23.224.100 -c 3 > /dev/null 2>&1

        if [ $? -eq 0 ] ; then
                status="Alive"
        else
                status="Unreachable Please Check the Server"
        fi
        print_status $counter $IP $status
        print_status $counter $IP $status >> /root/logs/Ping-report.`date +%d%m%y_%H`
        counter=`expr $counter + 1`
done
