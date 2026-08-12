#!/bin/bash

sudo mkdir -p /var/run/mysqld
sudo chown mysql:mysql /var/run/mysqld

if pgrep mysqld > /dev/null; then
    echo "MySQL is already running."
else
    echo "Starting MySQL..."
    sudo mysqld_safe --user=mysql > /tmp/mysql-start.log 2>&1 &
    sleep 5

    if pgrep mysqld > /dev/null; then
        echo "MySQL started successfully."
    else
        echo "MySQL failed to start."
        cat /tmp/mysql-start.log
        exit 1
    fi
fi