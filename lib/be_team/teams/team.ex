defmodule BeTeam.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :description, :string

    belongs_to :team_type, BeTeam.Teams.TeamType, foreign_key: :type_id
    has_many :employees, BeTeam.Teams.Employee

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :type_id, :description])
    |> validate_required([:name, :type_id, :description])
  end
end
