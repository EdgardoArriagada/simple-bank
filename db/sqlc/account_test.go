package db

import (
	"context"
	"testing"

	"example.com/simple-bank/util"
	"github.com/stretchr/testify/require"
)

func createRandomAccount(t *testing.T) Account {
	// Arrange
	arg := CreateAccountParams{
		Owner:    util.RandomOwner(),
		Balance:  util.RandomMoney(),
		Currency: util.RandomCurrency(),
	}

	// Act
	account, err := testQueries.CreateAccount(context.Background(), arg)

	// Expect
	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, arg.Owner, account.Owner)
	require.Equal(t, arg.Balance, account.Balance)
	require.Equal(t, arg.Currency, account.Currency)

	require.NotZero(t, account.ID)
	require.NotZero(t, account.CreatedAt)

	return account
}

func TestCreateAccount(t *testing.T) {
	createRandomAccount(t)
}

func TestGetAccount(t *testing.T) {
	account1 := createRandomAccount(t)
	account1, err := testQueries.GetAccount(context.Background(), account1.ID)

	require.NoError(t, err)
	require.NotEmpty(t, account1)

	require.Equal(t, account1.ID, account1.ID)
	require.Equal(t, account1.Owner, account1.Owner)
	require.Equal(t, account1.Balance, account1.Balance)
	require.Equal(t, account1.Currency, account1.Currency)
}
