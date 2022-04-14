FROM	debian:buster

RUN	apt-get update &&\
	apt-get -y upgrade &&\
	apt-get -y install nginx\
	openssl &&\
	openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Gam/CN=jeokim" -keyout /etc/ssl/private/jeokim_p.key -out /etc/ssl/certs/jeokim.crt &&\
	chmod 600 /etc/ssl/certs/jeokim.crt /etc/ssl/private/jeokim_p.key

COPY	./conf/default	/etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]
