#!/bin/bash
for i in `cat ntp-list`
do echo "----$i----"
#ssh $i  yum install telnet xinetd
done
