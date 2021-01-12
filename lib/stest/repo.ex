defmodule Stest.Repo do
  use Ecto.Repo,
    otp_app: :stest,
    adapter: Ecto.Adapters.Postgres
end
