#!/bin/bash
rm /var/run/httpd.pid
echo $MYSQL_PORT_3306_TCP_ADDR > /srv/http/inc/srv_addr
php-fpm -D
httpd -D FOREGROUND
