# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Security.Repo.insert!(%Security.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Security.Repo
alias Security.Role
alias Security.User

#
# Add default roles

with roles <- ~w(admin customer manager) do
  for role <- roles do
    Repo.get_by(Role, name: role) || Repo.insert!(%Role{name: role})
  end
end

#
# Add default users

users = [
  {"admin@test.com", "admin"},
  {"customer@test.com", "customer"},
  {"manager@test.com", "manager"}
]

for {username, role_name} <- users do
   role = Role |> Repo.get_by(name: role_name)

   Repo.get_by(User, username: username) || %User{}
   |> User.changeset(%{username: username})
   |> Ecto.Changeset.put_assoc(:role, role)
   |> Repo.insert
end
