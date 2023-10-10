defmodule BeTeam.TeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BeTeam.Teams` context.
  """

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        type: "some type"
      })
      |> BeTeam.Teams.create_team()

    team
  end

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        description: "some description",
        first_name: "some first_name",
        last_name: "some last_name",
        role: "some role",
        surname: "some surname"
      })
      |> BeTeam.Teams.create_employee()

    employee
  end
end
