#!/bin/bash
#
/usr/sbin/sshd -D
su git -c "/usr/share/gogs/gogs web --config /data/gogs/conf/app.ini"
