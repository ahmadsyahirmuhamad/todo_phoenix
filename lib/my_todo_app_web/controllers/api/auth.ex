defmodule MyTodoAppWeb.Api.Auth do
  import Plug.Conn

  alias MyTodoApp.TodoApp.User

  # receive :repo from router pipeline
  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    case get_req_header(conn, "authorization") do
      [auth] ->
        user = repo.get(User, auth)
        conn = assign(conn, :current_user, user)
      _ ->
        conn
    end
  end



end
