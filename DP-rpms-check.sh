#!/bin/bash
for i in `cat dp-client-list`
do echo "-----------$i---------"
ssh $i << EOF 
 rpm -qa | grep -i OB2;
 systemctl stop firewalld; 
systemctl disable firewalld;
systemctl start xinetd
EOF
done
