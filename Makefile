DOCKER_COMPOSE_FILE	=	srcs/docker-compose.yml
DIR	=	/home/jeokim/data/wordpress\
		/home/jeokim/data/mariadb


all: $(DIR)
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d --build

$(DIR):
	mkdir -p $(DIR)

re: clean all

stop:
	docker-compose -f $(DOCKER_COMPOSE_FILE) stop

clean: stop
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

ps:
	docker-compose -f $(DOCKER_COMPOSE_FILE) ps

open_n:
	docker exec -it srcs_nginx_1 /bin/bash

open_wp:
	docker exec -it srcs_wordpress_1 /bin/bash

log:
	docker logs srcs_nginx_1
	docker logs srcs_wordpress_1

.PHONY : all re stop clean ps

# docker container stop $(docker ps -a -q)
# docker rmi -f $(docker images -qa)
# docker volume rm $(docker volume ls -q)
# docker system prune


# sudo rm -rf /home/jeokim/data

# mount file 만들기
# sudo mkdir -p /home/jeokim/data/wordpress && sudo mkdir -p /home/jeokim/data/mariadb
