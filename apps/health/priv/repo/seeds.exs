# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Health.Repo.insert!(%Health.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Health.Repo
alias Health.User
alias Health.Patient

user = Repo.get_by(User, username: "customer@test.com")

%Patient{}
|> Patient.changeset(%{name: "Alan", surname: "Turing"})
|> Ecto.Changeset.put_assoc(:user, user)
|> Repo.insert
