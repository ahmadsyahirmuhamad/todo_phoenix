# require IEx
# IEx.pry
defmodule MyTodoAppWeb.Api.SessionController do
  use MyTodoAppWeb, :controller

  alias MyTodoApp.TodoApp.Auth.Auth


  require Logger

  def create(conn, %{"email" => email, "password" => password}) do
    case Auth.authenticate(email, password) do
      {:ok, user} ->
         conn
         |> sign_in(user)
         |> render("login.json")
      {:error, _} ->
        conn
        |> put_status(:unprocessable_entity)
    end
  end

  defp sign_in(conn, user) do
     conn
     |> MyTodoApp.Guardian.Plug.sign_in(user)
     |> add_jwt
  end

  defp add_jwt(conn) do # <- 3
    # user = MyTodoApp.Guardian.Plug.current_resource(conn)
    # IO.inspect user
    jwt = MyTodoApp.Guardian.Plug.current_token(conn)
    assign(conn, :jwt, jwt)
  end

end
