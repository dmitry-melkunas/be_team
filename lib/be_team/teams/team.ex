defmodule BeTeam.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :type, :string
    field :description, :string

    has_many :employees, BeTeam.Teams.Employee

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :type, :description])
    |> validate_required([:name, :type, :description])
  end
end
