#!/bin/bash

sudo mkdir -p /var/run/mysqld
sudo chown mysql:mysql /var/run/mysqld

if ! pgrep mysqld > /dev/null; then
    sudo mysqld_safe --user=mysql > /tmp/mysql-start.log 2>&1 &
fi
