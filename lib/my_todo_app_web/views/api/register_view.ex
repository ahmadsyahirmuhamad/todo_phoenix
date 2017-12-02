defmodule MyTodoAppWeb.Api.RegisterView do
  use MyTodoAppWeb, :view

  def render("create.json", %{jwt: jwt, user: user} ) do
    %{ data: %{ user: user, jwt: jwt } }
  end

  def render("error.json", _params) do
    %{ data: "error" }
  end

end
