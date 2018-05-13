#!/bin/bash
for i in `cat phy-list-2`
do echo "----$i----"
echo "172.23.224.0/24 via 172.23.230.1 dev eth2" | ssh root@$i 'cat >>/etc/sysconfig/network-scripts/route-eth2'
ssh $i service network start
done
