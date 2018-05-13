#!/bin/bash
for i in `cat syslog11`
do echo "----$i----"
echo "auth.notice;authpriv.*  @172.23.224.99:514" | ssh root@$i 'cat >> cat >> /etc/rsyslog.conf'
ssh $i /bin/systemctl restart rsyslog.service
done

