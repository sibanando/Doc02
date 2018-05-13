#!/bin/bash
for i in `cat phy-list-route-243.lst`
do
echo "----$i----"
echo "172.23.224.59 via 172.23.243.1 dev eth2
172.23.224.60 via 172.23.243.1 dev eth2
172.23.224.204 via 172.23.243.1 dev eth2
172.23.224.203 via 172.23.243.1 dev eth2" | ssh root@$i 'cat >>/etc/sysconfig/network-scripts/route-bond2'
done
