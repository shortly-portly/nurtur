defmodule Nurtur.Repo do
  use Ecto.Repo,
    otp_app: :nurtur,
    adapter: Ecto.Adapters.Postgres
end
