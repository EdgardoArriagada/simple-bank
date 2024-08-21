generate migration

```sh
# create migration
migrate create -ext sql -dir db/migration -seq init_schema

# run tests
go test example.com/simple-bank/db/sqlc
```
