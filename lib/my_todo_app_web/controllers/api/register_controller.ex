# require IEx
# IEx.pry
defmodule MyTodoAppWeb.Api.RegisterController do
  use MyTodoAppWeb, :controller

  alias MyTodoApp.TodoApp
  alias MyTodoApp.TodoApp.User

  def create(conn, user_params) do
    case TodoApp.create_user(user_params) do
      {:ok, %User{} = user} ->
        conn
        |> assign(:user, user)
        |> sign_in(user)
        |> render("new_user.json")
      {:error, _} ->
        conn
          |> render("error.json")
    end
  end

  defp sign_in(conn, user) do
     conn
     |> MyTodoApp.Guardian.Plug.sign_in(user)
     |> add_jwt
  end

  defp add_jwt(conn) do
    jwt = MyTodoApp.Guardian.Plug.current_token(conn)
    assign(conn, :jwt, jwt)
  end


end
