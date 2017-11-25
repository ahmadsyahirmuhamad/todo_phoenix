defmodule MyTodoApp.TodoApp do
  import Ecto.Query, warn: false
  alias MyTodoApp.Repo
  alias MyTodoApp.TodoApp.User

  def list_users do
    Repo.all(User)
  end

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
end