FROM    debian:buster

RUN     apt-get update &&\
        apt-get upgrade -y &&\
        apt-get install -y php7.3-fpm\
        wget\
        curl

RUN     wget https://wordpress.org/wordpress-5.9.2.tar.gz -P /var/www &&\
        tar -xvf /var/www/wordpress-5.9.2.tar.gz &&\
        mv wordpress /var/www/ &&\
        rm /var/www/wordpress-5.9.2.tar.gz

CMD     ["bash"]