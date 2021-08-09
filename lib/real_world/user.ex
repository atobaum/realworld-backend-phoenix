defmodule RealWorld.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :bio, :string
    field :email, :string
    field :image, :string
    field :password_hash, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :username, :bio, :image, :password_hash])
    |> validate_required([:email, :username, :bio, :image, :password_hash])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end
end
