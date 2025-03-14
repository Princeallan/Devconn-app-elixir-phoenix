defmodule Myapp.Plugs.ApiLogger do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    IO.inspect("Request: #{conn.method} #{conn.request_path}")
    conn
  end
end
