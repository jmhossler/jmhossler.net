import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :personal_info, PersonalInfo.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "personal_info_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :personal_info_web, PersonalInfoWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wqSV0Ms6GqA+/NGoVNCQZVB7/bdIdzPw2VyemDs9vFLOwLByTADxCWbtpBXP9Z41",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :personal_info, PersonalInfo.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
