defmodule BeTeam.Repo.Migrations.BindEmployeeToTeam do
  use Ecto.Migration

  def change do
    alter table(:employees) do
      add :team_id, references(:teams, on_delete: :nothing)
    end
  end
end
