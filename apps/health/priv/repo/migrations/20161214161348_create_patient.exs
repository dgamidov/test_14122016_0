defmodule Health.Repo.Migrations.CreatePatient do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :name, :string
      add :surname, :string

      timestamps()
    end

  end
end
