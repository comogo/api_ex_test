defmodule ApiExTest.Auth do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    secret_token = Application.get_env(:api_ex_test, :secret_token)
    [token] = get_req_header(conn, "x-store-token")

    if token != secret_token do
      conn
        |> put_resp_content_type("application/json")
        |> send_resp(401, "Unauthorized")
        |> halt
    else
      conn
    end
  end
end
