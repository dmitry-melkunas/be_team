defmodule BeTeam.Teams.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :first_name, :string
    field :last_name, :string
    field :surname, :string
    field :role, :string
    field :description, :string

    belongs_to :team, BeTeam.Teams.Team

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:first_name, :surname, :last_name, :role, :description])
    |> validate_required([:first_name, :surname, :last_name, :role, :description])
  end
end
