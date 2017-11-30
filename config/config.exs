# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_todo_app,
  ecto_repos: [MyTodoApp.Repo]

# Configures the endpoint
config :my_todo_app, MyTodoAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PtgoIF9dSOaUsaKhyrBjTBhL0Cgl1kYnBxPL+jVifl3yZ1dP3gMOmdxAr2IFljcW",
  render_errors: [view: MyTodoAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyTodoApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Guardian
config :my_todo_app, MyTodoApp.AuthAccessPipeline,
  module: MyTodoApp.Guardian,
  error_handler: MyTodoApp.TodoApp.Auth.AuthErrorHandler

config :my_todo_app, MyTodoApp.Guardian,
allowed_algos: ["HS512"], # optional
verify_module: Guardian.JWT,  # optional
issuer: "my_todo_app",
ttl: { 30, :days},
verify_issuer: true,
secret_key: "mVGcIMDQ/t+s+va9f5r9VqsOsvPZNO58jbs7wlVOsRZJz1Z+opLVDVchZxloTVy6",
serializer: MyTodoAppWeb.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
