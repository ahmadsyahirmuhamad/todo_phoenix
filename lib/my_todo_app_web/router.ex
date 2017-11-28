defmodule MyTodoAppWeb.Router do
  use MyTodoAppWeb, :router

  # pipeline :browser do
  #   plug :accepts, ["html"]
  #   plug :fetch_session
  #   plug :fetch_flash
  #   plug :protect_from_forgery
  #   plug :put_secure_browser_headers
  # end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.Pipeline, module: MyTodoApp.Guardian, error_handler: MyTodoApp.TodoApp.Auth.AuthErrorHandler
    plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
    # plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  end

  pipeline :ensure_authed_access do
    plug Guardian.Plug.EnsureAuthenticated
    # should set handler controller
    # Lookup a resource directly from a token
    # set current_user to the resources
  end

  scope "/api", MyTodoAppWeb.Api do
    pipe_through :api
    resources "/sessions", SessionController
  end

  scope "/api", MyTodoAppWeb.Api do
    pipe_through([:api, :ensure_authed_access])
    resources "/users", UserController
  end

end
