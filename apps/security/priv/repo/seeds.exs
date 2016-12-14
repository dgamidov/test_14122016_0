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

#
# Add default roles

with roles <- ~w(admin customer manager) do
  for role <- roles do
    Repo.get_by(Role, name: role) || Repo.insert!(%Role{name: role})
  end
end
