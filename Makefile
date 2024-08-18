migrateup:
	migrate --path db/migration --database "postgresql://my_user:my_password@localhost:5432/postgres?sslmode=disable" -verbose up

migratedown:
	migrate --path db/migration --database "postgresql://my_user:my_password@localhost:5432/postgres?sslmode=disable" -verbose down

.PHONY: migrateup migratedown
