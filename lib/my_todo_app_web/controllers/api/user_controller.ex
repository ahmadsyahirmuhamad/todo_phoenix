defmodule MyTodoAppWeb.Api.UserController do
  use MyTodoAppWeb, :controller

  alias MyTodoApp.TodoApp
  alias MyTodoApp.TodoApp.User

  def index(conn, _params) do
    users = TodoApp.list_users()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = TodoApp.get_user(id)
    render(conn, "show.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- TodoApp.create_user(user_params) do
      conn
        |> put_status(:created)
        |> render("show.json", user: user)
    end
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
    with {:ok, %User{} = user} <- TodoApp.delete_user(user) do
      conn
        |> send_resp(200, "ok")
    end
  end

end
