defmodule MyTodoAppWeb.PageController do
  use MyTodoAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
