#!/bin/bash
for i in `cat phy-list-1`
do echo "----$i----"
ssh $i cat /etc/hosts | grep -i BKP
done
