defmodule TodoApp.Repo.Migrations.CreateTaskListTable do
  use Ecto.Migration

  def change do
    create table(:tasks_list_assocs) do
      add(:task_id, references(:tasks, on_delete: :nothing))
      add(:task_list_id, references(:task_lists, on_delete: :nothing))

      timestamps()
    end
    create(index(:tasks_list_assocs, [:task_id, :task_list_id]))
  end
end
