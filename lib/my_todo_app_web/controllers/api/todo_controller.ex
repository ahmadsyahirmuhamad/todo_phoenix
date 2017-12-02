defmodule MyTodoAppWeb.Api.TodoController do
  use MyTodoAppWeb, :controller

  alias MyTodoApp.TodoApp
  alias MyTodoApp.TodoApp.Todo

  def index(conn, _params) do
    user = MyTodoApp.Guardian.Plug.current_resource(conn)
    todos = TodoApp.list_todos(user)
    render(conn, "index.json", todos: todos)
  end

  def show(conn, %{"id" => id}) do
    todo = TodoApp.get_todo(id)
    render(conn, "show.json", todo: todo)
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

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = TodoApp.get_todo(id)
    case TodoApp.update_todo(todo, todo_params) do
      {:ok, %Todo{} = todo} ->
        conn
        |> render("show.json", todo: todo)
      {:error, changeset} ->
        conn
        |> render("error.json")
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = TodoApp.get_todo(id)
    case TodoApp.delete_todo(todo) do
      {:ok, %Todo{} = todo} ->
        conn
        |> render("show.json", todo: todo)
      :error ->
        conn
        |> render("error.json")
    end
  end

  def completed(conn, %{"todo_id" => todo_id, "todo" => todo_params}) do
    todo = TodoApp.get_todo(todo_id)
    case TodoApp.completed_todo(todo, todo_params) do
      {:ok, %Todo{} = todo} ->
        conn
        |> render("show.json", todo: todo)
      :error ->
        conn
        |> render("error.json")
    end
  end

end
