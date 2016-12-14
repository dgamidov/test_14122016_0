defmodule Security.Repo.Migrations.CreateUser do
  use Ecto.Migration

  @schema_prefix Application.fetch_env!(:security, :schema_prefix)

  def change do
    create table(:users, prefix: @schema_prefix) do
      add :username, :string
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:users, [:username], prefix: @schema_prefix)
    create index(:users, [:role_id], prefix: @schema_prefix)

  end
end
