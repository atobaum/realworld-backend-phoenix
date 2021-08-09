defmodule RealWorld.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :slug, :string
      add :title, :string
      add :description, :string
      add :body, :string
      add :tag_list, {:array, :string}
      add :author_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:articles, [:slug])
    create index(:articles, [:author_id])
  end
end
