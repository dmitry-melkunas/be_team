import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :be_team, BeTeam.Repo,
  username: "root",
  password: "dummy",
  hostname: "localhost",
  database: "be_team_test",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :be_team, BeTeamWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "EDFL9gEhiPz3FK0zPrvDB4ZGl4HmStS9DA1niaFkY87ADDzXozU3ROnGKzRcFgRZ",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
