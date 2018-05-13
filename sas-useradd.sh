#!/bin/bash
# Script to add a user to Linux system
# Created By Satish Prajapati for FSS UNIX UserID creation 
# -------------------------------------------------------------------------
groupadd -g 3011 sas
if [ $(id -u) -eq 0 ]; then
user1=sas
user2=sasdemo
user3=sassrv
cuser1="SAS Administration Account - mbhardwaj8@csc.com"
	username=Nothing
        password="Welcome@2o!8"

egrep "^$username" /etc/passwd >/dev/null
        if [ $? -eq 0 ]; then
                echo "$username exists!"
                exit 1
        else
                pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -u 3011 -g 3011 -c "$cuser1" -m -p $pass $user1
useradd -u 3012 -g 3011 -c "$cuser1" -m -p $pass $user2
useradd -u 3013 -g 3011 -c "$cuser1" -m -p $pass $user3
[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
        fi
else
        echo "Only root may add a user to the system"
        exit 2
fi

echo "%sas    ALL=(ALL) ALL" >>/etc/sudoers
