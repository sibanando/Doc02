#!/bin/bash
for i in `cat sys11`
do echo "----$i----"
ssh $i cat /etc/rsyslog.conf | grep -i @172.23.224;ip r l | grep -i 172.23.224
done
