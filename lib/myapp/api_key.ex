defmodule Myapp.ApiKey do
  use Ecto.Schema
  import Ecto.Changeset

  schema "api_keys" do
    field :key, :string
    field :limit, :integer
    field :remaining, :integer
  end

  def changeset(api_key, attrs) do
    api_key
    |> cast(attrs, [:key, :limit, :remaining])
    |> validate_required([:key, :limit, :remaining])
    |> unique_constraint(:key)
  end

end
