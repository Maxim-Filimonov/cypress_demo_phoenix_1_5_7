defmodule CypressDemoWeb.ContactController do
  use CypressDemoWeb, :controller
  alias CypressDemo.{Contact, Repo}

  def index(conn, _params) do
    conn
    |> Plug.Conn.assign(:contacts, Repo.all(Contact))
    |> render("index.html")
  end

  def full_name(contact) do
    contact.first_name + " " + contact.last_name
  end
end
