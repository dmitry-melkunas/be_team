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
alias BeTeam.Teams.Role

~w"QA Front Dev DevOps Support BA"
|> Enum.each(fn name ->
  TeamType.changeset(%TeamType{}, %{name: name})
  |> Repo.insert(on_conflict: :nothing)
end)

~w"Lead Developer QA DevOps Support BA Architect HR Account Manager Lawyer"
|> Enum.each(fn name ->
  Role.changeset(%Role{}, %{name: name})
  |> Repo.insert(on_conflict: :nothing)
end)
