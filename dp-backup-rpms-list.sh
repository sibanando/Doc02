#!/bin/bash
for i in `cat non-prod-backup-RHEV-list`
do echo "----$i----"
ssh $i hostname -A
ssh $i rpm -qa | grep -i OB2  
done
