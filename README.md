generate migration

```sh
# create migration
migrate create -ext sql -dir db/migration -seq init_schema

# running migrations
migrate --path db/migration --database "postgresql://my_user:my_password@localhost:5432/postgres?sslmode=disable" -verbose up
## or
migrate --path db/migration --database "postgresql://my_user:my_password@localhost:5432/postgres?sslmode=disable" -verbose down
```
