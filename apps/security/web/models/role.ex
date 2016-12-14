defmodule Security.Role do
  use Security.Web, :model

  @schema_prefix Application.fetch_env!(:security, :schema_prefix)

  schema "roles" do
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
