defmodule BeTeam.Teams.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :name, :string

    many_to_many :employees, BeTeam.Teams.Employee, join_through: "employees_to_roles", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
