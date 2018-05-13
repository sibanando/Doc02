#!/bin/bash
for i in `cat cbsjira`
do
echo "----$i----"
ssh $i df -HT
ssh $i lsscsi -s
done
