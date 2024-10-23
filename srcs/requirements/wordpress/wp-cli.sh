#!/bin/bash

if [ ! -f wp-config.php ];
then
	wp core download --allow-root

	wp config create --allow-root \
					 --dbname=$SQL_DB \
					 --dbuser=$SQL_USER \
					 --dbpass=$SQL_PASS \
					 --dbhost=mariadb

	wp core install  --allow-root \
					 --skip-email \
					 --title="inception" \
					 --url=$WP_ADM_URL \
					 --admin_user=$WP_ADM_USER \
					 --admin_password=$WP_ADM_PASS \
					 --admin_email=$WP_ADM_MAIL

	wp user create   --allow-root $WP_USER $WP_MAIL \
					 --user_pass=$WP_PASS
fi
/usr/sbin/php-fpm7.4 -F

# docker exec -it mariadb /bin/bash
# mysql -h mariadb -P 3306 -u mnascime --password
# SHOW DATABASES; --> USE inception --> SHOW TABLES;