defmodule BeTeam.Repo.Migrations.CreateEmployeeToRoles do
  use Ecto.Migration

  def change do
    create table(:employees_to_roles, primary_key: false) do
      add :employee_id, references(:employees, on_delete: :nothing)
      add :role_id, references(:roles, on_delete: :nothing)
    end

    create unique_index(:employees_to_roles, [:employee_id, :role_id])
    create index(:employees_to_roles, [:employee_id])
  end
end
