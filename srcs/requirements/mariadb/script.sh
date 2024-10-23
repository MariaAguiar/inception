#!/bin/bash

if ! [ -d "$SQL_DB" ]; 
then
	service mariadb start

	mariadb -u root -e "
	CREATE DATABASE IF NOT EXISTS $SQL_DB;
	CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';
	GRANT ALL PRIVILEGES ON $SQL_DB.* TO '$SQL_USER'@'%';
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOTPASS';
	FLUSH PRIVILEGES;
	SHUTDOWN;"
fi
mysqld_safe --bind-address=0.0.0.0
