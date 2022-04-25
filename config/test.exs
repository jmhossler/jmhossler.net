import Config

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
