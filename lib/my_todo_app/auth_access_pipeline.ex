defmodule MyTodoApp.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :my_todo_app

  # plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.VerifyHeader, claims: %{typ: "access"}

  # plug Guardian.Plug.VerifySession
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
  plug MyTodoApp.TodoApp.Auth.CurrentUser

end