defmodule MyTodoAppWeb.Api.UserController do
  use MyTodoAppWeb, :controller

  alias MyTodoApp.TodoApp
  alias MyTodoApp.TodoApp.User

  def show(conn, %{"id" => id}) do
    user = TodoApp.get_user(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = TodoApp.get_user(id)
    with {:ok, %User{} = user} <- TodoApp.update_user(user, user_params) do
      conn
        |> render("show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = TodoApp.get_user(id)
    with {:ok, %User{} = _user} <- TodoApp.delete_user(user) do
      conn
        |> send_resp(200, "ok")
    end
  end

end
