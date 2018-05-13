#!/bin/bash
for i in `cat phy-list`
do echo "----$i----"
echo "192.168.124.0/24 via 192.168.226.1 dev bond1" | ssh root@$i 'cat >>/etc/sysconfig/network-scripts/route-eth1'
ssh $i service network start
done
