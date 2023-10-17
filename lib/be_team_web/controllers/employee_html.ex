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
    team_type = BeTeam.Teams.get_team_type!(team.type_id)
    assigns = assign(assigns, :team_name, team.name)
    assigns = assign(assigns, :team_type, team_type.name)
    ~H"""
    <b><%= @team_name %></b> / <%= @team_type %>
    """
  end

  attr :employee, :map, required: true

  def show_roles(assigns) do
    roles = BeTeam.Teams.list_roles_for_employee(assigns.employee)
    assigns = assign(assigns, :roles, roles)
    ~H"""
    <%= for role <- @roles do %>
    <ul>
    <li><%= role.name %></li>
    </ul>
    <% end %>
    """
  end
end
