defmodule MyTodoAppWeb.Api.RegisterView do
  use MyTodoAppWeb, :view

  def render("new_user.json", %{jwt: jwt, user: user} = params ) do
    %{ data: %{ user: user, jwt: jwt } }
  end

  def render("error.json", _params) do
    %{ data: "error" }
  end

end