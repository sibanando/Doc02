#!/bin/bash
for i in `cat list`
do echo "-----------$i---------"
ssh $i mkdir /root/xorg-java;
scp  /root/xorg-java/* root@$i:/root/xorg-java/;
ssh $i;cd /root/xorg-java/
 rpm -ivh libepoxy-1.3.1-1.el7.x86_64.rpm libXaw-1.0.13-4.el7.x86_64.rpm libXdmcp-1.1.2-6.el7.x86_64.rpm libXfont2-2.0.1-2.el7.x86_64.rpm libxkbfile-1.0.9-3.el7.x86_64.rpm libXpm-3.5.12-1.el7.x86_64.rpm xkeyboard-config-2.20-1.el7.noarch.rpm xorg-x11-apps-7.7-7.el7.x86_64.rpm xorg-x11-server-common-1.19.3-11.el7.x86_64.rpm xorg-x11-server-Xorg-1.19.3-11.el7.x86_64.rpm xorg-x11-xkb-utils-7.7-12.el7.x86_64.rpm jdk-8u151-linux-x64.rpm
rm -r /root/xorg-java;exit
done
