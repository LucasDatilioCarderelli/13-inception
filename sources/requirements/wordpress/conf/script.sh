#!/bin/bash

if [ ! -f ./wp-config.php ]; then
    cp wp-config-sample.php wp-config.php
    sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
    sed -i "s/localhost/$MYSQL_HOST/g" wp-config.php
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php

    wp core install --allow-root --url=https://$DOMAIN_NAME --title="My first blog" --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=$MYSQL_USER@email.com
    wp user create --allow-root $WORDPRESS_USER $WORDPRESS_USER@email.com --user_pass=$WORDPRESS_PASSWORD 
fi

exec php-fpm7.4 -F -R
