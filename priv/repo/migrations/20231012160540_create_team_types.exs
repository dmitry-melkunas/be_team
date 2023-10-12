defmodule BeTeam.Repo.Migrations.CreateTeamTypes do
  use Ecto.Migration

  def change do
    create table(:team_types) do
      add :name, :string

      timestamps()
    end
  end
end
