
if [ ! -e /var/www/wordpress/wp-config.php ]; then
# wp-config.php file 만들기
    until   wp config create    --allow-root --dbname=$WP_DB_NAME --dbuser=$DB_ADMIN_NAME\
                                --dbpass=$DB_ADMIN_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'; do
            echo "Waiting for mariadb to start..."
		    sleep 2
    done
    # wordpress 세팅하기
    # --allow-root : 관리자 권한 허용
    wp core install     --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER1_NAME\
                        --admin_password=$WP_USER1_PASSWORD --admin_email=$WP_EMAIL1 --path='/var/www/wordpress'
    wp user create      --allow-root $WP_USER2_NAME $WP_EMAIL2 --user_pass=$WP_USER2_PASSWORD --role=author\
                        --path='/var/www/wordpress'
fi

# foreground로 실행하기
mkdir ./run/php/
/usr/sbin/php-fpm7.3 -F

# user 확인하기
# wp user list --allow-root
