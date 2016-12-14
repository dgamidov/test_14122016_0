mix ecto.create

mix ecto.migrate -r Security.Repo
mix ecto.migrate -r Health.Repo

mix run apps/security/priv/repo/seeds.exs
mix run apps/health/priv/repo/seeds.exs
