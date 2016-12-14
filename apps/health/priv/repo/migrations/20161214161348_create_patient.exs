defmodule Health.Repo.Migrations.CreatePatient do
  use Ecto.Migration

  @schema_prefix Application.fetch_env!(:health, :schema_prefix)

  def change do
    create table(:patients, prefix: @schema_prefix) do
      add :user_id, :integer
      add :name, :string
      add :surname, :string

      timestamps()
    end

  end
end
