#!/bin/bash
for i in `cat non-prod-backup-RHEV-list`
do echo "----$i----"
ssh $i hostname -A
ssh $i  yum install -y OB2-DA-A.09.00-1.x86_64 OB2-CORE-A.09.00-1.x86_64 OB2-TS-CORE-A.09.00-1.x86_64 OB2-MA-A.09.00-1.x86_64 
done
