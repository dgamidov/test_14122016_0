defmodule Security.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:users, [:username])
    create index(:users, [:role_id])

  end
end
