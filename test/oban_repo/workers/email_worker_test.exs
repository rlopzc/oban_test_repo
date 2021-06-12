defmodule EmailWorkerTest do
  use ExUnit.Case, async: true
  use Oban.Testing, repo: ObanRepo.Repo

  alias ObanRepo.Workers

  test "worker success" do
    user_id = 1
    assert :ok = perform_job(Workers.EmailWoker, %{id: user_id})
  end
end
