defmodule TodoAppWeb.TaskListController do
  use TodoAppWeb, :controller

  alias TodoApp.Todos
  alias TodoApp.Todos.TaskList

  def index(conn, _params) do
    task_lists = Todos.list_task_lists()
    render(conn, "index.html", task_lists: task_lists)
  end

  def new(conn, _params) do
    changeset = Todos.change_task_list(%TaskList{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task_list" => task_list_params}) do
    case Todos.create_task_list(task_list_params) do
      {:ok, task_list} ->
        conn
        |> put_flash(:info, "Task list created successfully.")
        |> redirect(to: Routes.task_list_path(conn, :show, task_list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task_list = Todos.get_task_list!(id)
    render(conn, "show.html", task_list: task_list)
  end

  def edit(conn, %{"id" => id}) do
    task_list = Todos.get_task_list!(id)
    changeset = Todos.change_task_list(task_list)
    render(conn, "edit.html", task_list: task_list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task_list" => task_list_params}) do
    task_list = Todos.get_task_list!(id)

    case Todos.update_task_list(task_list, task_list_params) do
      {:ok, task_list} ->
        conn
        |> put_flash(:info, "Task list updated successfully.")
        |> redirect(to: Routes.task_list_path(conn, :show, task_list))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task_list: task_list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task_list = Todos.get_task_list!(id)
    {:ok, _task_list} = Todos.delete_task_list(task_list)

    conn
    |> put_flash(:info, "Task list deleted successfully.")
    |> redirect(to: Routes.task_list_path(conn, :index))
  end
end
