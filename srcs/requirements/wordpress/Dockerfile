FROM    debian:buster

RUN     apt-get update &&\
        apt-get upgrade -y &&\
        apt-get install -y php7.3\
        php7.3-fpm\
        php-mysqli\
        wget\
        curl

RUN     wget https://wordpress.org/wordpress-5.9.2.tar.gz -P /var/www &&\
        tar -xvf /var/www/wordpress-5.9.2.tar.gz &&\
        mv wordpress /var/www/ &&\
        rm /var/www/wordpress-5.9.2.tar.gz
RUN		chown -R www-data:www-data /var/www/wordpress

COPY	./conf/www.conf			/etc/php/7.3/fpm/pool.d

# wordpress-client 다운받기
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
		chmod +x wp-cli.phar &&\
		mv wp-cli.phar /usr/local/bin/wp


COPY    ./conf/run.sh   /
CMD     bash /run.sh

# RUN     ["mkdir", "./run/php/"]

# CMD     ["/usr/sbin/php-fpm7.3", "-F"]
