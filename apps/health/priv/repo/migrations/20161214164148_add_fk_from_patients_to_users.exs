defmodule Health.Repo.Migrations.AddFkFromPatientsToUsers do
  use Ecto.Migration

  @schema_prefix Application.fetch_env!(:health, :schema_prefix)
  @security_schema_prefix Application.fetch_env!(:security, :schema_prefix)

  def up do
    execute "ALTER TABLE #{@schema_prefix}.patients
              ADD CONSTRAINT patients_user_id_fkey
              FOREIGN KEY (user_id) REFERENCES #{@security_schema_prefix}.users (id)
              MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION"
  end

  def down do
    execute "ALTER TABLE #{@schema_prefix}.patients
              DROP CONSTRAINT patients_user_id_fkey"
  end
end
