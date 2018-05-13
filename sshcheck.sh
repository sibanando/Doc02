#!/bin/bash
for i in `cat thick_new_vms`
do echo "----$i----"
ssh $i hostname 
done
