#!/bin/bash
for i in `cat newvm`
do echo "----$i----"
ssh $i hostname;date 
done
