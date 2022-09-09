defmodule TodoApp.Repo.Migrations.CreateCollabTaskListTable do
  use Ecto.Migration

  def change do
    create table(:collab_task_list_assocs) do
      add(:user_id, references(:users, on_delete: :nothing))
      add(:task_list_id, references(:task_lists, on_delete: :nothing))

      timestamps()
    end
    create(index(:collab_task_list_assocs, [:user_id, :task_list_id]))
  end
end
