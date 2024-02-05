LOGIN = ldatilio
VOLUMES_PATH = /home/$(LOGIN)/data
COMPOSE_PATH = ./srcs/docker-compose.yml

export LOGIN

all: build up

build:
	sudo mkdir -p $(VOLUMES_PATH)/mariadb $(VOLUMES_PATH)/wordpress
	if [ -z "$(grep -s '$(LOGIN).42.fr' /etc/hosts)" ]; then \
		echo "127.0.0.1 $(LOGIN).42.fr" | sudo tee -a /etc/hosts ; \
	fi
	docker-compose -f $(COMPOSE_PATH) build

up:
	docker-compose -f $(COMPOSE_PATH) up -d

down:
	docker-compose -f $(COMPOSE_PATH) down

clean: down
	sudo sed -i.bak '/127.0.0.1 $(LOGIN).42.fr/d' /etc/hosts

fclean:
	docker-compose -f $(COMPOSE_PATH) down --rmi all

re: clean all

logs:
	docker-compose -f $(COMPOSE_PATH) logs -f --tail 5

.PHONY: all build up down clean fclean re
