use Mix.Config

config :api_ex_test, secret_token: System.get_env("SECRET_TOKEN")
config :api_ex_test, cowboy_port: System.get_env("PORT")
