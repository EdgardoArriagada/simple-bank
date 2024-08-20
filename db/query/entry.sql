-- name: CreateAccount :one
INSERT INTO entries (
  account_id, amount
) VALUES (
  $1, $2
) RETURNING *;

-- name: GetAccount :one
SELECT * FROM entries
WHERE id = $1;

-- name: ListAccounts :many
SELECT * from entries
ORDER BY id
LIMIT $1 OFFSET $2;

-- name: UpdateAccount :one
UPDATE entries
SET amount = $2
WHERE id = $1
RETURNING *;

-- name: DeleteAccount :exec
DELETE FROM entries
WHERE id = $1;
