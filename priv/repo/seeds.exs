# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Myapp.Repo.insert!(%Myapp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Myapp.Repo
alias Myapp.ApiKey

Repo.insert!(%ApiKey{key: "test_key_1", limit: 1000, remaining: 1000})
Repo.insert!(%ApiKey{key: "test_key_2", limit: 500, remaining: 500})
