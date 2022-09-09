defmodule TodoApp.Todos.CollabTaskListAssocs do
  use Ecto.Schema
  import Ecto.Changeset

  alias TodoApp.Todos.TaskList
  alias TodoApp.Accounts.User

  schema "collab_task_list_assocs" do
    belongs_to :user, User
    belongs_to :task_list, TaskList

    timestamps()
  end

  def changeset(struct, params) do
    IO.inspect(binding())

    struct
    |> cast(params, [])
  end
end
