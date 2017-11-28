defmodule MyTodoApp.TodoApp.Auth.Auth do
  alias MyTodoApp.Repo
  alias MyTodoApp.TodoApp.User

  def authenticate(email, password) do
    with %User{} = user <- Repo.get_by(User, email: email),
         {:ok, _} <- Comeonin.Bcrypt.check_pass(user, password) do
      {:ok, user}
    else
      _ -> {:error, "Invalid credentials"}
    end
  end
end
