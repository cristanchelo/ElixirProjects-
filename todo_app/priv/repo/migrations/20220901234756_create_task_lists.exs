defmodule TodoApp.Repo.Migrations.CreateTaskLists do
  use Ecto.Migration

  def change do
    create table(:task_lists) do
      add :name, :string
      add :tags, {:array, :string}
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:task_lists, [:user_id])
  end
end
