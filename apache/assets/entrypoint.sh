#!/bin/bash
rm /var/run/httpd.pid
php-fpm -D
httpd -D FOREGROUND
