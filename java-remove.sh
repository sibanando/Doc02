#!/bin/bash
for i in cat 'java-remove.lst'
do
echo "---$i----"
ssh $i rpm -e java*
ssh $i rpm -qa | grep -i java
done
