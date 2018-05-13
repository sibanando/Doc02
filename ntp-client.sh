#!/bin/bash
for i in `cat ntp-list`
do echo "----$i----"
ssh $i service xinetd start
done
