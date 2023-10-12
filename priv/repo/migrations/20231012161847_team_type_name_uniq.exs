defmodule BeTeam.Repo.Migrations.TeamTypeNameUniq do
  use Ecto.Migration

  def change do
    create unique_index(:team_types, :name)
  end
end
