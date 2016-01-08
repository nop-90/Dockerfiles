#!/bin/bash
# Source : https://github.com/DigitallySeamless/mariadb-armv6h-docker/blob/master/docker-entrypoint.sh 
datadir=/var/lib/mysql

if [[ ! -e $datadir/mysql ]]; then
  chmod 700 $datadir
  /usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=$datadir
  chown -R mysql:mysql $datadir &>/dev/null

  TEMP_FILE='/tmp/mysql-first-time.sql'
  echo "DELETE FROM mysql.user ;" >> "$TEMP_FILE"
  echo "CREATE USER 'root'@'%' IDENTIFIED BY 'root' ;" >> "$TEMP_FILE"
  echo "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION ;" >> "$TEMP_FILE"
  echo "DROP DATABASE IF EXISTS test ;" >> "$TEMP_FILE"

  echo 'FLUSH PRIVILEGES ;' >> "$TEMP_FILE"
  mysqld_safe --init-file="$TEMP_FILE"
fi
chown -R mysql:mysql $datadir
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'
