defmodule RealWorld.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    field :article_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
