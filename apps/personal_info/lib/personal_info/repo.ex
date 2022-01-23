defmodule PersonalInfo.Repo do
  use Ecto.Repo,
    otp_app: :personal_info,
    adapter: Ecto.Adapters.Postgres
end
