defmodule Security.User do
  use Security.Web, :model

  schema "users" do
    field :username, :string
    belongs_to :role, Security.Role

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end
