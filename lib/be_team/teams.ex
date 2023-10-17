defmodule BeTeam.Teams do
  @moduledoc """
  The Teams context.
  """

  import Ecto.Query, warn: false
  alias BeTeam.Repo

  alias BeTeam.Teams.Team

  @doc """
  Returns the list of teams.

  ## Examples

      iex> list_teams()
      [%Team{}, ...]

  """
  def list_teams do
    Repo.all(Team)
  end

  @doc """
  Gets a single team.

  Raises `Ecto.NoResultsError` if the Team does not exist.

  ## Examples

      iex> get_team!(123)
      %Team{}

      iex> get_team!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team!(id), do: Repo.get!(Team, id)

  @doc """
  Creates a team.

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team.

  ## Examples

      iex> update_team(team, %{field: new_value})
      {:ok, %Team{}}

      iex> update_team(team, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a team.

  ## Examples

      iex> delete_team(team)
      {:ok, %Team{}}

      iex> delete_team(team)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team changes.

  ## Examples

      iex> change_team(team)
      %Ecto.Changeset{data: %Team{}}

  """
  def change_team(%Team{} = team, attrs \\ %{}) do
    Team.changeset(team, attrs)
  end

  alias BeTeam.Teams.Employee

  @doc """
  Returns the list of employees.

  ## Examples

      iex> list_employees()
      [%Employee{}, ...]

  """
  def list_employees do
    Repo.all(Employee)
  end

  @doc """
  Gets a single employee.

  Raises `Ecto.NoResultsError` if the Employee does not exist.

  ## Examples

      iex> get_employee!(123)
      %Employee{}

      iex> get_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee!(id), do: Repo.get!(Employee, id)

  @doc """
  Creates a employee.

  ## Examples

      iex> create_employee(%{field: value})
      {:ok, %Employee{}}

      iex> create_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> change_employee(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee.

  ## Examples

      iex> update_employee(employee, %{field: new_value})
      {:ok, %Employee{}}

      iex> update_employee(employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee(%Employee{} = employee, attrs) do
    employee
    |> change_employee(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee.

  ## Examples

      iex> delete_employee(employee)
      {:ok, %Employee{}}

      iex> delete_employee(employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee(%Employee{} = employee) do
    Repo.delete(employee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee changes.

  ## Examples

      iex> change_employee(employee)
      %Ecto.Changeset{data: %Employee{}}

  """
  def change_employee(%Employee{} = employee, attrs \\ %{}) do
    # TODO: validate each role_id is valid
    roles = get_roles(attrs["role_ids"])
    attrs = Map.put(attrs, "roles", roles)

    employee
    |> Repo.preload([:roles])
    |> Employee.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:roles, roles)
  end

  def list_team_types do
    Repo.all(BeTeam.Teams.TeamType)
  end

  def list_team_types_for_select do
    list_team_types()
    |> Enum.reduce([], fn ttype, acc -> [{ttype.name, ttype.id} | acc ] end)
  end

  def get_team_type!(type_id) do
    Repo.get!(BeTeam.Teams.TeamType, type_id)
  end

  def get_roles(nil), do: []

  def get_roles(role_ids) do
    Repo.all(
      from r in BeTeam.Teams.Role,
      where: r.id in ^role_ids
    )
  end

  def list_roles_for_employee(employee_id) when is_integer(employee_id) do
    employee_id
    |> get_employee!()
    |> list_roles_for_employee()
  end

  def list_roles_for_employee(%Employee{} = employee) do
    employee = Repo.preload(employee, [:roles])
    employee.roles
  end

  def list_roles_for_select() do
    Repo.all(BeTeam.Teams.Role)
    |> Enum.map(fn role -> [key: role.name, value: role.id] end)
  end

  def list_roles_for_select(employee_or_id) do
    selected_role_ids =
      list_roles_for_employee(employee_or_id)
      |> Enum.map(fn role -> role.id end)

    list_roles_for_select()
    |> Enum.map(
      fn option ->
        new_key = {:selected, option[:value] in selected_role_ids}
        [new_key | option]
      end)
  end
end
