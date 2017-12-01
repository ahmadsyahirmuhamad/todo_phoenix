defmodule MyTodoAppWeb.Api.TodoView do
  use MyTodoAppWeb, :view
  alias MyTodoAppWeb.Api.TodoView

  def render("index.json", %{todos: todos}) do
    %{data: render_many(todos, TodoView, "todo.json")}
  end

  def render("show.json", %{todo: todo}) do
    %{data: render_one(todo, TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{ todo: todo }
  end

  def render("error.json", _params) do
    %{ data: "error" }
  end

end
