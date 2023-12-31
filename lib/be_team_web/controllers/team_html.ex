defmodule BeTeamWeb.TeamHTML do
  use BeTeamWeb, :html

  embed_templates "team_html/*"

  @doc """
  Renders a team form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def team_form(assigns)

  attr :selected_team_id, :integer, default: nil

  def team_selector(assigns) do
    teams = BeTeam.Teams.list_teams()
    assigns = assign(assigns, :teams, teams)
    ~H"""
    <select name="employee[team_id]">
      <%= for team <- @teams do %>
      <option value={team.id} selected={team.id == @selected_team_id}>
        <%= team.name %>
      </option>
      <% end %>
    </select>
    """
  end

  attr :type_id, :integer, required: true

  def team_type(assigns) do
    type = BeTeam.Teams.get_team_type!(assigns.type_id)
    assigns = assign(assigns, :type_name, type.name)
    ~H"<%= @type_name %>"
  end
end
