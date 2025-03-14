defmodule MyappWeb.ApiController do
  use MyappWeb, :controller

  def test(conn, _params) do
    json(conn, %{message: "Request successful"})
  end
end
