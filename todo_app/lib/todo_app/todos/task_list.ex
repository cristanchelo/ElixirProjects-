defmodule TodoApp.Todos.TaskList do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  alias TodoApp.Accounts.User

  schema "task_lists" do
    field :name, :string
    field :tags, {:array, :string}
    field :user_id, :id
    has_many :collaborators, User
    timestamps()
  end

  @doc false
  def changeset(task_list, attrs) do
    task_list
    |> cast(attrs, [:name, :tags, :user_id])
    |> cast_assoc(:collaborators)
    |> validate_required([:name, :tags, :user_id])
  end

  def task_lists_by_user(user_id) do
    from t in __MODULE__,
      where: t.user_id == ^user_id,
      order_by: [asc: t.inserted_at],
      limit: 5
  end
end
