defmodule BeTeam.Repo.Migrations.RemoveRoleFromEmployee do
  use Ecto.Migration

  def change do
    alter table(:employees) do
      remove :role
    end
  end
end
