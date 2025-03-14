defmodule Myapp.Plugs.RateLimit do
  import Plug.Conn
  alias Myapp.RateLimiter

  def init(opts), do: opts

  def call(conn, _opts) do
    api_key = get_req_header(conn, "api-key") |> List.first()
    case RateLimiter.check_limit(api_key) do
      {:ok, _} -> conn
      {:error, :limit_exceeded} -> conn |> send_resp(429, "Rate limit exceeded") |> halt()
      {:error, :invalid_key} -> conn |> send_resp(401, "Invalid API key") |> halt()
    end
  end
end
