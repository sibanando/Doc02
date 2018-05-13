#!/bin/bash
for i in `cat mod-ssl-list`
do
echo "---$i-----"
ssh $i rpm -qa | grep -i mod_ssl
ssh $i rpm -qa | grep -i httpd-2.4.6-67.el7_4.6.x86_64 
done
