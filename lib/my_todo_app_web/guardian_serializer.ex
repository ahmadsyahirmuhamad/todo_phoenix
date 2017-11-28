defmodule MyTodoAppWeb.GuardianSerializer do
  @behaviour Guardian.Serializer

  require Logger

  alias MyTodoApp.TodoApp.User
  alias MyTodoApp.Repo

  def for_token(%User{id: id}), do: {:ok, "User:#{id}"}
  def for_token(_) do
    {:error, "Unknown resource type"}
  end

  def from_token("User:" <> id) do
    {:ok, Repo.get(User, id)}
  end
  def from_token(_) do
    {:error, "Unknown resource type"}
  end
end
