#!/bin/bash
for i in `mod_ssl-list`
do echo "-----------$i---------"
scp  /root/mod_ssl-2.4.6-67.el7_4.6.x86_64.rpm root@$i:/root
ssh $i  rpm -ivh mod_ssl-2.4.6-67.el7_4.6.x86_64.rpm
ssh $i /usr/bin/rm /root/mod_ssl-2.4.6-67.el7_4.6.x86_64.rpm
#ssh $i rpm -qa | grep -i mod_ssl
done
