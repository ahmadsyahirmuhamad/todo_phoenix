defmodule MyTodoAppWeb.Api.SessionView do
  use MyTodoAppWeb, :view

  def render("login.json", %{jwt: jwt} ) do
    %{ jwt: jwt }
  end

end
