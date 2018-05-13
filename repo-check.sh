#!/bin/bash
for i in `cat uat-sit-staging`
do
echo "----$i----"
ssh $i cat /etc/yum.repos.d/file.repo
done
