migrateup:
	migrate --path db/migration --database "postgresql://my_user:my_password@localhost:5432/postgres?sslmode=disable" -verbose up

migratedown:
	migrate --path db/migration --database "postgresql://my_user:my_password@localhost:5432/postgres?sslmode=disable" -verbose down

start:
	docker-compose up

stop:
	docker-compose down

sqlc:
	sqlc generate

test:
	docker container exec -it simple-bank-backend-1 go test -v -cover ./...

.PHONY: migrateup migratedown start stop sqlc test
