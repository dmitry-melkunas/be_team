defmodule BeTeam.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :first_name, :string
      add :surname, :string
      add :last_name, :string
      add :role, :string
      add :description, :string

      timestamps()
    end
  end
end
