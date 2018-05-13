#!/bin/bash
for i in `cat prod-list`
do echo "----$i----"
ssh $i cp /etc/resolv.conf /etc/resolv.conf.org
cat /root/resolv.conf | ssh root@$i 'cat > /etc/resolv.conf'
done
