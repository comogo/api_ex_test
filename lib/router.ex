defmodule ApiExTest.Router do
  use Plug.Router

  plug Plug.Logger
  plug ApiExTest.Auth
  plug Plug.Parsers, parsers: [:json],
                     pass: ["application/json"],
                     json_decoder: Poison
  plug :match
  plug :dispatch

  get "/" do
    conn
      |> put_resp_content_type("application/json")
      |> send_resp( 200, Poison.encode!(%{message: "Hello World, Elixir!"}))
  end

  match _, do: send_resp(conn, 404, "Oops!")
end
