
all:
	@if [ ! -e "/home/mnascime/data" ]; then \
		sudo mkdir /home/mnascime/data; \
	fi
	@if [ ! -e "/home/mnascime/data/wordpress" ]; then \
		sudo mkdir /home/mnascime/data/wordpress; \
	fi
	@if [ ! -e "/home/mnascime/data/mariadb" ]; then \
		sudo mkdir /home/mnascime/data/mariadb; \
	fi
	docker-compose -f ./srcs/docker-compose.yml up --build

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	sudo rm -rf /home/mnascime/data/wordpress /home/mnascime/data/mariadb
	yes | docker system prune -a -f
	yes | docker image prune -a -f
	yes | docker container prune -f
	yes | docker builder prune -a -f
	yes | docker network prune -f
	yes | docker volume prune -f

re: fclean all
