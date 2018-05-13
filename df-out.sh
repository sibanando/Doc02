#!/bin/bash
for i in `cat total-server-list`
do echo "----$i ----"; ssh $i hostname; ssh $i df -lh
done
