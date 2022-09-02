defmodule TodoApp.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoApp.Todos` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        done: true
      })
      |> TodoApp.Todos.create_task()

    task
  end

  @doc """
  Generate a task_list.
  """
  def task_list_fixture(attrs \\ %{}) do
    {:ok, task_list} =
      attrs
      |> Enum.into(%{
        name: "some name",
        tags: []
      })
      |> TodoApp.Todos.create_task_list()

    task_list
  end
end
