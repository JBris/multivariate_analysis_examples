include .env

pull: 
	docker-compose pull

dbuild: 
	docker-compose build

#make up 
#make up s=service
#make up a="-f docker-compose.yml -f docker-compose.override.yml"
up:
	docker-compose $(a) up -d $(s)

down: 
	docker-compose down

start:
	docker-compose $(a) start
	
stop:
	docker-compose $(a) stop

restart:
	docker-compose restart $(s)

ls:
	docker-compose ps 

vol:
	docker volume ls

log:
	docker-compose logs datascience
	
#See docker-compose rm
#make rm a="--help"
rm: 
	docker system prune ${a} --all

enter:
	docker-compose exec datascience sh

#make run c="echo hello world"
run:
	docker-compose run datascience $(c)
