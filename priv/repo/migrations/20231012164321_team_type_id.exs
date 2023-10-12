defmodule BeTeam.Repo.Migrations.TeamTypeId do
  use Ecto.Migration

  def change do
    alter table :teams do
      add :type_id, references(:team_types, on_delete: :nothing)
      remove :type
    end
  end
end
