defmodule TodoApp.TodosTest do
  use TodoApp.DataCase

  alias TodoApp.Todos

  describe "tasks" do
    alias TodoApp.Todos.Task

    import TodoApp.TodosFixtures

    @invalid_attrs %{description: nil, done: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Todos.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Todos.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{description: "some description", done: true}

      assert {:ok, %Task{} = task} = Todos.create_task(valid_attrs)
      assert task.description == "some description"
      assert task.done == true
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{description: "some updated description", done: false}

      assert {:ok, %Task{} = task} = Todos.update_task(task, update_attrs)
      assert task.description == "some updated description"
      assert task.done == false
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_task(task, @invalid_attrs)
      assert task == Todos.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Todos.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Todos.change_task(task)
    end
  end

  describe "task_lists" do
    alias TodoApp.Todos.TaskList

    import TodoApp.TodosFixtures

    @invalid_attrs %{name: nil, tags: nil}

    test "list_task_lists/0 returns all task_lists" do
      task_list = task_list_fixture()
      assert Todos.list_task_lists() == [task_list]
    end

    test "get_task_list!/1 returns the task_list with given id" do
      task_list = task_list_fixture()
      assert Todos.get_task_list!(task_list.id) == task_list
    end

    test "create_task_list/1 with valid data creates a task_list" do
      valid_attrs = %{name: "some name", tags: []}

      assert {:ok, %TaskList{} = task_list} = Todos.create_task_list(valid_attrs)
      assert task_list.name == "some name"
      assert task_list.tags == []
    end

    test "create_task_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todos.create_task_list(@invalid_attrs)
    end

    test "update_task_list/2 with valid data updates the task_list" do
      task_list = task_list_fixture()
      update_attrs = %{name: "some updated name", tags: []}

      assert {:ok, %TaskList{} = task_list} = Todos.update_task_list(task_list, update_attrs)
      assert task_list.name == "some updated name"
      assert task_list.tags == []
    end

    test "update_task_list/2 with invalid data returns error changeset" do
      task_list = task_list_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_task_list(task_list, @invalid_attrs)
      assert task_list == Todos.get_task_list!(task_list.id)
    end

    test "delete_task_list/1 deletes the task_list" do
      task_list = task_list_fixture()
      assert {:ok, %TaskList{}} = Todos.delete_task_list(task_list)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_task_list!(task_list.id) end
    end

    test "change_task_list/1 returns a task_list changeset" do
      task_list = task_list_fixture()
      assert %Ecto.Changeset{} = Todos.change_task_list(task_list)
    end
  end
end
