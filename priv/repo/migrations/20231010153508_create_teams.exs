defmodule BeTeam.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :type, :string
      add :description, :string

      timestamps(type: :utc_datetime_usec)
    end
  end
end
