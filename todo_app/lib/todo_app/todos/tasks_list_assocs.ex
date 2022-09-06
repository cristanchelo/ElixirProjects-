defmodule TodoApp.Todos.TasksListAssoc do
  use Ecto.Schema
  import Ecto.Changeset

  alias TodoApp.Todos.TaskList
  alias TodoApp.Todos.Task

  schema "tasks_list_assocs" do
    belongs_to :task, Task
    belongs_to :task_list, TaskList

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:task_id, :task_list_id])
    |> IO.inspect()
  end

end
