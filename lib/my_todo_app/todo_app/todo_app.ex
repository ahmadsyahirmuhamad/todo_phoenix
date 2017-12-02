defmodule MyTodoApp.TodoApp do
  import Ecto.Query, warn: false
  alias MyTodoApp.Repo
  alias MyTodoApp.TodoApp.User
  alias MyTodoApp.TodoApp.Todo

  # use by guardian to get user
  def get_resource_by_id(id) do
    get_user(id)
  end

  # FOR USER
  def get_user(id), do: Repo.get(User, id)

  def create_user(attrs \\ %{}) do
    User.changeset(:create, %User{}, attrs)
      |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    User.changeset(:update, user, attrs)
      |> Repo.update()
  end

  def change_password(%User{} = user, attrs) do
    User.changeset(:change_password, user, attrs)
      |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  # FOR TODO
  def get_todo(id), do: Repo.get(Todo, id)

  def list_todos(user) do
    Repo.all(Ecto.assoc(user, :todos))
  end

  def create_todo(current_user, attrs \\ %{}) do
    Todo.changeset(:create, %Todo{user: current_user}, attrs)
      |> Repo.insert()
  end

  def update_todo(%Todo{} = todo, attrs) do
    Todo.changeset(:update, todo, attrs)
      |> Repo.update()
  end

  def delete_todo(%Todo{} = todo) do
    Repo.delete(todo)
  end

end

