defmodule MyTodoApp.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :my_todo_app

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
  # mostly usefull on website not api
  # plug MyTodoApp.TodoApp.Auth.CurrentUser

end