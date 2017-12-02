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
    # plug MyTodoApp.TodoApp.Utils.DebugMe
  end

  pipeline :ensure_authed_access do
    plug MyTodoApp.AuthAccessPipeline
  end

  scope "/api", MyTodoAppWeb.Api do
    pipe_through :api
    resources "/register", RegisterController, only: [:create]
    resources "/sessions", SessionController, only: [:create]
  end

  scope "/api", MyTodoAppWeb.Api do
    pipe_through([:api, :ensure_authed_access])
    resources "/users", UserController, only: [:show, :update, :delete]
    resources "/todos", TodoController, only: [:index, :show, :create, :update, :delete] do
      post "/completed", TodoController, :completed
    end
    # change password
  end

end
