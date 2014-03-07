#!/bin/bash

[mysqld]
datadir=/opt/lib/mysqld
socket=/var/lib/mysql/mysql.sock

max_allowed_packet=20M

[mysql-safe]
log-error=/opt/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

