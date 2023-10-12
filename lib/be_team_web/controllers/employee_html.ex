defmodule BeTeamWeb.EmployeeHTML do
  use BeTeamWeb, :html

  embed_templates "employee_html/*"

  @doc """
  Renders a employee form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def employee_form(assigns)

  def get_team_name(team_id) do
    team = BeTeam.Teams.get_team!(team_id)
    team.name
  end

  def show_team(assigns) do
    team = BeTeam.Teams.get_team!(assigns.team_id)
    assigns = assign(assigns, :team_name, team.name)
    assigns = assign(assigns, :team_type, team.type)
    ~H"""
    <b><%= @team_name %> / <%= @team_type %></b>
    """
  end
end
