defmodule Myapp.Repo.Migrations.CreateApiKeys do
  use Ecto.Migration

  def change do
    create table(:api_keys) do
      add :key, :string, null: false
      add :limit, :integer, null: false
      add :remaining, :integer, null: false
      timestamps()
    end

    create unique_index(:api_keys, [:key])
  end
end
