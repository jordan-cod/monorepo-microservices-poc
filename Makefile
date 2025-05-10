COMPOSE_DEV = docker-compose -f docker-compose.yml -f docker-compose.override.yml
COMPOSE_PROD = docker-compose -f docker-compose.yml

.PHONY: defualt dev stop update

## Sobe todos os serviços em modo prod
default:
	$(COMPOSE_PROD) up --build -d

## Sobe todos os serviços em modo dev
dev:
	$(COMPOSE_DEV) up --build -d

## Para e remove os containers
stop:
	docker-compose down

## Atualiza os submódulos
update:
	git submodule update --init --recursive --remote