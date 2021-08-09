defmodule RealWorld.Repo.Migrations.CreateUserFollowings do
  use Ecto.Migration

  def change do
    create table(:user_followings) do
      add :follower_id, references(:users, on_delete: :nothing)
      add :followee_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_followings, [:follower_id])
    create index(:user_followings, [:followee_id])
  end
end
