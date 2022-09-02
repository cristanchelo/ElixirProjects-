defmodule TodoApp.Repo.Migrations.AddTaskListToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:task_list_id, references(:task_lists), null: true)
    end
  end
end
