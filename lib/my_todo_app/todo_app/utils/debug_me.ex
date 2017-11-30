require Logger

defmodule MyTodoApp.TodoApp.Utils.DebugMe do
  def init(_), do: :ok

  def call(conn, _) do
     Logger.debug inspect conn.req_headers
     Logger.debug inspect conn.req_cookies
     Logger.debug inspect Map.get(conn.private, :plug_session)

     conn
  end
end