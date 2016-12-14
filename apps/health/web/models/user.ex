defmodule Health.User do
  use Health.Web, :model

  @schema_prefix Application.fetch_env!(:security, :schema_prefix)

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
