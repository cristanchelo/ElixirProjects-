defmodule TodoApp.Todos.TaskList do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  alias TodoApp.Accounts.User
  alias TodoApp.Todos.TasksListAssoc

  schema "task_lists" do
    field :name, :string
    field :tags, {:array, :string}
    belongs_to :user, User
    has_many :collaborators, User
    many_to_many :tasks, TodoApp.Todos.Task, join_through: TasksListAssoc
    timestamps()
  end

  @doc false
  def changeset(task_list, attrs) do
    task_list
    |> cast(attrs, [:name, :tags, :user_id])
    |> validate_required([:name, :tags, :user_id])
    |> cast_assoc(:tasks)
    |> IO.inspect()
  end

  def task_lists_by_user(user_id) do
    from t in __MODULE__,
      where: t.user_id == ^user_id,
      order_by: [asc: t.inserted_at],
      limit: 5
  end
end
