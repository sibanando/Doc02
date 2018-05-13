#!/bin/bash
for i in `cat pit`
do echo "----$i----"
ssh $i hostname;cat /etc/passwd | grep -i secadm;su - secadm
done
