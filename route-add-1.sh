#!/bin/bash
for i in `cat phy-list`
do echo "----$i----"
ssh $i yum install telnet xinetd
done
