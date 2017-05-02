build:
	@docker-compose down
	@docker-compose up --build -d

start:
	@docker-compose up

clean:
	@docker-compose down
