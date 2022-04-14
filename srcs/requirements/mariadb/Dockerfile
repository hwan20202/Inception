FROM	debian:buster

RUN     apt-get -y update &&\
		apt-get -y upgrade &&\
		apt-get -y install mariadb-server

# mariadb config file를 복사
COPY    conf/50-server.cnf		/etc/mysql/mariadb.conf.d/

# mariadb database, user 만들기
COPY	./conf/run.sh			/run.sh
CMD		bash /run.sh
