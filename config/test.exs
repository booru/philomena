import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
config :philomena, Philomena.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "postgres",
  database: "philomena_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :philomena,
  redis_host: "redis"

config :exq,
  host: "redis"

config :philomena, Philomena.Mailer, adapter: Bamboo.LocalAdapter
config :philomena, :mailer_address, "test@philomena.lc"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :philomena, PhilomenaWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
