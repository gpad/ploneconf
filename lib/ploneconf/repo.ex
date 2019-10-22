defmodule Ploneconf.Repo do
  use Ecto.Repo,
    otp_app: :ploneconf,
    adapter: Ecto.Adapters.Postgres
end
