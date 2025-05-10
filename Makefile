COMPOSE_DEV = docker-compose -f docker-compose.yml -f docker-compose.override.yml

.PHONY: dev dev-auth dev-payments dev-profile stop update

## Sobe todos os serviços em modo dev
dev:
	$(COMPOSE_DEV) up --build

## Para e remove os containers
stop:
	docker-compose down

## Atualiza os submódulos
update:
	git submodule update --init --recursive --remote