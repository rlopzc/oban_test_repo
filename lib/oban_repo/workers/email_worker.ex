defmodule ObanRepo.Workers.EmailWoker do
  use Oban.Worker, queue: :default

  alias ObanRepo.Accounts

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id}}) do
    user = Accounts.get_user!(id)

    IO.inspect(user)
    IO.puts("sending email to: #{user.id}")

    :ok
  end
end
