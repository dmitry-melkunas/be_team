defmodule BeTeam.Teams.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :first_name, :string
    field :last_name, :string
    field :surname, :string
    field :description, :string

    belongs_to :team, BeTeam.Teams.Team
    many_to_many :roles, BeTeam.Teams.Role, join_through: "employees_to_roles", on_replace: :delete

    timestamps(type: :utc_datetime_usec)
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:first_name, :surname, :last_name, :description, :team_id])
    |> validate_required([:first_name, :surname, :last_name, :description, :team_id])
    |> validate_role_ids_length(attrs)
  end

  def validate_role_ids_length(%Ecto.Changeset{valid?: false} = cs, _attrs), do: cs

  def validate_role_ids_length(%Ecto.Changeset{valid?: true} = cs, attrs) do
    case attrs["role_ids"] do
      [_|_] -> cs
      _ -> Ecto.Changeset.add_error(
             cs,
             :role_ids,
             "can't be blank",
             []
           )
    end
  end
end
