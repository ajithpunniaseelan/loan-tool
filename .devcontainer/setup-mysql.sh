#!/bin/bash

set -e

echo "Installing MySQL..."

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

echo "Configuring MySQL..."

sudo service mysql start

sudo mysql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

CREATE DATABASE IF NOT EXISTS loan_db;

CREATE USER IF NOT EXISTS 'loan_user'@'localhost'
IDENTIFIED WITH mysql_native_password BY 'loan_password';

GRANT ALL PRIVILEGES ON loan_db.* TO 'loan_user'@'localhost';

FLUSH PRIVILEGES;
EOF

echo "MySQL setup completed."
