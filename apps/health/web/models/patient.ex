defmodule Health.Patient do
  use Health.Web, :model

  @schema_prefix Application.fetch_env!(:health, :schema_prefix)

  schema "patients" do
    field :name, :string
    field :surname, :string

    belongs_to :user, Health.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :surname])
    |> validate_required([:name, :surname])
  end
end
