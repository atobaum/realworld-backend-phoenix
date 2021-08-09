defmodule RealWorld.UserFollowing do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_followings" do
    field :follower_id, :id
    field :followee_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_following, attrs) do
    user_following
    |> cast(attrs, [])
    |> validate_required([])
  end
end
