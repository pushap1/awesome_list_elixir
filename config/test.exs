use Mix.Config
# We don't run a server during test. If one is required,
# you can enable the server option below.
config :awesome, AwesomeWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :github_api_client, :base_url, "https://api.github.com"

config :github_api_client, :http_client, Mock

# Configure your database
config :awesome, Awesome.Repo,
  username: "postgres",
  password: "postgres",
  database: "awesome_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
