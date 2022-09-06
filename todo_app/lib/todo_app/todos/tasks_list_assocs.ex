defmodule TodoApp.Todos.TasksListAssoc do
  use Ecto.Schema

  alias TodoApp.Todos.TaskList
  alias TodoApp.Todos.Task

  schema "tasks_list_assocs" do
    belongs_to :task, Task
    belongs_to :task_list, TaskList

    timestamps()
  end

end
