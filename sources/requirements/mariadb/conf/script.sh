service mariadb start
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already exists"
else
    mariadb -e "CREATE DATABASE $MYSQL_DATABASE;"
    mariadb -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'%'"
    mariadb -e "FLUSH PRIVILEGES"
fi
