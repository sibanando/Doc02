#!/bin/bash
for i in `cat non-prod`
do echo "----$i----"; ssh $i df  
done
