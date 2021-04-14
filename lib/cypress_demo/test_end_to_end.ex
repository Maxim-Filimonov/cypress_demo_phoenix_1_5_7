defmodule CypressDemo.Plug.TestEndToEnd do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/db/checkout" do
    # If the agent is registered and alive, a db connection is checked out already
    # Otherwise, we spawn the agent and let it(!) check out the db connection
    owner_process = Process.whereis(:db_owner_agent)

    if owner_process && Process.alive?(owner_process) do
      send_resp(conn, 200, "connection has already been checked out")
    else
      {:ok, _pid} = Agent.start_link(&checkout_shared_db_conn/0, name: :db_owner_agent)
      send_resp(conn, 200, "checked out database connection")
    end
  end

  post "/db/checkin" do
    # If the agent is registered and alive, we check the connection back in
    # Otherwise, no connection has been checked out, we ignore this
    owner_process = Process.whereis(:db_owner_agent)

    if owner_process && Process.alive?(owner_process) do
      Agent.get(owner_process, &checkin_shared_db_conn/1)
      Agent.stop(owner_process)
      send_resp(conn, 200, "checked in database connection")
    else
      send_resp(conn, 200, "connection has already been checked back in")
    end
  end

  match(_, do: send_resp(conn, 404, "not found"))

  defp checkout_shared_db_conn do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(CypressDemo.Repo, ownership_timeout: :infinity)
    :ok = Ecto.Adapters.SQL.Sandbox.mode(CypressDemo.Repo, {:shared, self()})
  end

  defp checkin_shared_db_conn(_) do
    :ok = Ecto.Adapters.SQL.Sandbox.checkin(CypressDemo.Repo)
  end
end
