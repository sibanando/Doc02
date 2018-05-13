#!/bin/bash
for i in `cat DP-list-21feb.lst`
do echo "-----------$i---------"
scp /root/OB2*.* root@$i:/root
ssh $i  rpm -ivh OB2-TS-CORE-A.09.00-1.x86_64.rpm OB2-MA-A.09.00-1.x86_64.rpm  OB2-DA-A.09.00-1.x86_64.rpm OB2-CORE-A.09.00-1.x86_64.rpm
ssh $i  rpm -qa | grep -i OB2
done
