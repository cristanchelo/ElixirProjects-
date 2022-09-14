defmodule TodoAppWeb.ListTaskLive do
  use TodoAppWeb, :live_view

  alias TodoApp.Todos.TaskList
  alias TodoApp.Todos.Task
  alias TodoApp.Todos

  def mount(_params, _session, socket) do
    changeset = Todos.change_task_list(%TaskList{})
    socket = socket |> assign(changeset: changeset, tasks: [])
    {:ok, socket}
  end

  def handle_event("add_task", _parans, socket) do
    socket =
      socket
      |> assign(:tasks, [%Task{} | socket.assigns.tasks])
    {:noreply, socket}
  end

  def handle_event("validate_task_" <> index, %{"task" => task_params}, socket) do
    {:noreply, socket}
  end

  def handle_event("validate", %{"task_lists" => list_params}, socket) do
    changeset =
      %TaskList{}
      |> Todos.change_list(Map.put(list_params, "user_id", 1))
      |> Map.put(:action, :insert)

      {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"task_lists" => list_params}, socket) do
    list_params
    |> Map.put("tasks", socket.assigns.tasks)
    |> IO.inspect()
    |> Map.put("user_id", 1)
    |> Todos.create_task_list()
    |> case do
      {:ok, list} ->
        socket
        |> put_flash(:info, "A list has been created")
        |> redirect(to: Routes.task_list_path(socket, :show, list))
        {:noreply, socket}
      {:error, changeset} ->
        nil
        {:error, assign(socket, :changeset, changeset)}
    end
  end
end
