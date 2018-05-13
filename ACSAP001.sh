#!/bin/bash
for i in '172.23.236.37'
do
ssh $i cp /etc/hosts /etc/hosts.org
ssh $i cp /etc/sysctl.conf /etc/sysctl.conf.org
ssh $i cp /etc/security/limitis.conf /etc/security/limitis.conf.org
ssh $i cp /etc/sysconfig/network-scripts/ifcfg-* /root/
ssh $i cp /etc/sysconfig/network-scripts/route* /root/
scp /root/acsap001/hosts root@$i:/etc
scp /root/acsap001/ifcfg-eth*  root@$i:/etc/sysconfig/network-scripts/
scp /root/acsap001/route-eth2  root@$i:/etc/sysconfig/network-scripts/
scp /root/acsap001/sysctl.conf root@$i:/etc
scp /root/acsap001/limits.conf root@$i:/etc/security/
done
