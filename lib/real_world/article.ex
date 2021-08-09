defmodule RealWorld.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :body, :string
    field :description, :string
    field :slug, :string
    field :tag_list, {:array, :string}
    field :title, :string
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:slug, :title, :description, :body, :tag_list])
    |> validate_required([:slug, :title, :description, :body, :tag_list])
    |> unique_constraint(:slug)
  end
end
