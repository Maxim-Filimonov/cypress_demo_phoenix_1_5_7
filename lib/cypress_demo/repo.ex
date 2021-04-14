defmodule CypressDemo.Repo do
  use Ecto.Repo,
    otp_app: :cypress_demo,
    adapter: Ecto.Adapters.Postgres
end
