defmodule BeTeam.TeamsTest do
  use BeTeam.DataCase

  alias BeTeam.Teams

  describe "teams" do
    alias BeTeam.Teams.Team

    import BeTeam.TeamsFixtures

    @invalid_attrs %{description: nil, name: nil, type: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Teams.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Teams.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{description: "some description", name: "some name", type: "some type"}

      assert {:ok, %Team{} = team} = Teams.create_team(valid_attrs)
      assert team.description == "some description"
      assert team.name == "some name"
      assert team.type == "some type"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", type: "some updated type"}

      assert {:ok, %Team{} = team} = Teams.update_team(team, update_attrs)
      assert team.description == "some updated description"
      assert team.name == "some updated name"
      assert team.type == "some updated type"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_team(team, @invalid_attrs)
      assert team == Teams.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Teams.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Teams.change_team(team)
    end
  end

  describe "employees" do
    alias BeTeam.Teams.Employee

    import BeTeam.TeamsFixtures

    @invalid_attrs %{description: nil, first_name: nil, last_name: nil, role: nil, surname: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Teams.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Teams.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{description: "some description", first_name: "some first_name", last_name: "some last_name", role: "some role", surname: "some surname"}

      assert {:ok, %Employee{} = employee} = Teams.create_employee(valid_attrs)
      assert employee.description == "some description"
      assert employee.first_name == "some first_name"
      assert employee.last_name == "some last_name"
      assert employee.role == "some role"
      assert employee.surname == "some surname"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teams.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{description: "some updated description", first_name: "some updated first_name", last_name: "some updated last_name", role: "some updated role", surname: "some updated surname"}

      assert {:ok, %Employee{} = employee} = Teams.update_employee(employee, update_attrs)
      assert employee.description == "some updated description"
      assert employee.first_name == "some updated first_name"
      assert employee.last_name == "some updated last_name"
      assert employee.role == "some updated role"
      assert employee.surname == "some updated surname"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Teams.update_employee(employee, @invalid_attrs)
      assert employee == Teams.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Teams.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Teams.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Teams.change_employee(employee)
    end
  end
end
