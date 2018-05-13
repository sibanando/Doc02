#!/bin/bash
for i in `cat phy-list`
do echo "----$i----"
ssh $i ntpdate -u 172.23.224.100
done
