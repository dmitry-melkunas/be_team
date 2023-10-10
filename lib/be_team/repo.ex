defmodule BeTeam.Repo do
  use Ecto.Repo,
    otp_app: :be_team,
    adapter: Ecto.Adapters.Postgres
end
