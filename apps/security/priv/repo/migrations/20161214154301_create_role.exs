defmodule Security.Repo.Migrations.CreateRole do
  use Ecto.Migration

  @schema_prefix Application.fetch_env!(:security, :schema_prefix)

  def change do
    create table(:roles, prefix: @schema_prefix) do
      add :name, :string

      timestamps()
    end
    create unique_index(:roles, [:name], prefix: @schema_prefix)

  end
end
