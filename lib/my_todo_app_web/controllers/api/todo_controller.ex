defmodule MyTodoAppWeb.Api.TodoController do
  use MyTodoAppWeb, :controller

  alias MyTodoApp.TodoApp
  alias MyTodoApp.TodoApp.Todo

  def index(conn, _params) do
    user = MyTodoApp.Guardian.Plug.current_resource(conn)
    todos = TodoApp.list_todos(user)
    render(conn, "index.json", todos: todos)
  end

  def create(conn, todo_params) do
    current_user = conn.assigns.current_user

    case TodoApp.create_todo(current_user, todo_params) do
      {:ok, %Todo{} = todo} ->
        conn
        |> render("show.json", todo: todo)
      {:error, changeset} ->
        conn
          |> render("error.json")
    end
  end

end
