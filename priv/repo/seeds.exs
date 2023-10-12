# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BeTeam.Repo.insert!(%BeTeam.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BeTeam.Repo
alias BeTeam.Teams.TeamType

types = ~w"QA Front Dev DevOps Support BA"
|> Enum.each(fn name ->
  args = %{name: name}
  TeamType.changeset(%TeamType{}, args) |>  Repo.insert(on_conflict: :nothing)
end)
