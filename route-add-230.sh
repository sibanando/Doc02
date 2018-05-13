#!/bin/bash
for i in `cat phy-list-route.lst`
do
echo "----$i----"
echo "172.23.224.59 via 172.23.230.1 dev bond2
172.23.224.60 via 172.23.230.1 dev bond2
172.23.224.204 via 172.23.230.1 dev bond2
172.23.224.203 via 172.23.230.1 dev bond2" | ssh root@$i 'cat >>/etc/sysconfig/network-scripts/route-bond2'
done
