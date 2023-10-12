defmodule BeTeam.Teams.TeamType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "team_types" do
    field :name, :string

    has_many :teams, BeTeam.Teams.Team

    timestamps()
  end

  @doc false
  def changeset(team_type, attrs) do
    team_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
