defmodule ObanRepo.Repo do
  use Ecto.Repo,
    otp_app: :oban_repo,
    adapter: Ecto.Adapters.Postgres
end
