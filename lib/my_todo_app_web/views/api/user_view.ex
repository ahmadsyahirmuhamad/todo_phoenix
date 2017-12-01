defmodule MyTodoAppWeb.Api.UserView do
  use MyTodoAppWeb, :view
  alias MyTodoAppWeb.Api.UserView

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{ user: user }
  end

  #  or (one by one)
  # def render("user.json", %{user: user}) do
  #   %{
  #     id: user.id,
  #     email: user.email,
  #     password_hash: user.password_hash,
  #     first_name: user.first_name,
  #     last_name: user.last_name,
  #   }
  # end
end
