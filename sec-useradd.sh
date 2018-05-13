#!/bin/bash
# Script to add a user to Linux system
# Created By Satish Prajapati for FSS UNIX UserID creation 
# -------------------------------------------------------------------------
groupadd -g 2012 secadm
if [ $(id -u) -eq 0 ]; then
user1=secadm
cuser1="Security Adminitrator - viveka.singh@hpe.com"
	username=Nothing
        password="Welcome20!8"

egrep "^$username" /etc/passwd >/dev/null
        if [ $? -eq 0 ]; then
                echo "$username exists!"
                exit 1
        else
                pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -u 2012 -g 2012 -c "$cuser1" -m -p $pass $user1
[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
        fi
else
        echo "Only root may add a user to the system"
        exit 2
fi

echo "%secadm    ALL=(ALL) ALL" >>/etc/sudoers
