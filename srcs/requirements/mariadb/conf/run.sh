# database의 값을 환경변수에서 받아서 설정하기
if [ ! -d /var/lib/mysql/$WP_DB_NAME ]; then
    service mysql start
    mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"
    mysql -e "CREATE USER '$DB_ADMIN_NAME'@'%' IDENTIFIED BY '$DB_ADMIN_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$DB_ADMIN_NAME'@'%';"
    mysql -e "GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PW' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"
    mysqladmin -u root -p$MYSQL_ROOT_PW shutdown
fi

# mariadb foreground로 실행하기
exec mysqld_safe
