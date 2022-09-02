defmodule TodoAppWeb.TaskListControllerTest do
  use TodoAppWeb.ConnCase

  import TodoApp.TodosFixtures

  @create_attrs %{name: "some name", tags: []}
  @update_attrs %{name: "some updated name", tags: []}
  @invalid_attrs %{name: nil, tags: nil}

  describe "index" do
    test "lists all task_lists", %{conn: conn} do
      conn = get(conn, Routes.task_list_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Task lists"
    end
  end

  describe "new task_list" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.task_list_path(conn, :new))
      assert html_response(conn, 200) =~ "New Task list"
    end
  end

  describe "create task_list" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.task_list_path(conn, :create), task_list: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.task_list_path(conn, :show, id)

      conn = get(conn, Routes.task_list_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Task list"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.task_list_path(conn, :create), task_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Task list"
    end
  end

  describe "edit task_list" do
    setup [:create_task_list]

    test "renders form for editing chosen task_list", %{conn: conn, task_list: task_list} do
      conn = get(conn, Routes.task_list_path(conn, :edit, task_list))
      assert html_response(conn, 200) =~ "Edit Task list"
    end
  end

  describe "update task_list" do
    setup [:create_task_list]

    test "redirects when data is valid", %{conn: conn, task_list: task_list} do
      conn = put(conn, Routes.task_list_path(conn, :update, task_list), task_list: @update_attrs)
      assert redirected_to(conn) == Routes.task_list_path(conn, :show, task_list)

      conn = get(conn, Routes.task_list_path(conn, :show, task_list))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, task_list: task_list} do
      conn = put(conn, Routes.task_list_path(conn, :update, task_list), task_list: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Task list"
    end
  end

  describe "delete task_list" do
    setup [:create_task_list]

    test "deletes chosen task_list", %{conn: conn, task_list: task_list} do
      conn = delete(conn, Routes.task_list_path(conn, :delete, task_list))
      assert redirected_to(conn) == Routes.task_list_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.task_list_path(conn, :show, task_list))
      end
    end
  end

  defp create_task_list(_) do
    task_list = task_list_fixture()
    %{task_list: task_list}
  end
end
