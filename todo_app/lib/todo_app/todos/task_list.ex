defmodule TodoApp.Todos.TaskList do
  use Ecto.Schema
  import Ecto.Changeset
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
    |> cast(attrs, [:name, :tags])
    |> validate_required([:name, :tags])
  end
end
