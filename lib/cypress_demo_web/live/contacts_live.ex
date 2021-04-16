defmodule CypressDemoWeb.ContactsLive do
  use CypressDemoWeb, :live_view
  alias CypressDemo.{Contact, Repo}

  def render(assigns) do
    ~L"""
    <%= for contact <- @contacts do %>
    <div>
      Contact for
      <span><%= contact.first_name %> </span>
      <span><%= contact.last_name %></span>
    </div>
    <% end %>
    <hr/>
    <form phx-submit="new_contact">
      <fieldset>
        <legend>New Contact:</legend>
        <input type="text" name="first_name" placeholder="First name"/>
        <input type="text" name="last_name" placeholder="Last name"/>
      </fieldset>
        <input type="submit"/>
    </form>
    """
  end

  def mount(_params, _session, socket) do
    contacts = Contact |> Repo.all()
    socket = socket |> assign(contacts: contacts)
    {:ok, socket}
  end

  @impl true
  def handle_event("new_contact", payload, socket) do
    attrs = for {key, val} <- payload, into: %{}, do: {String.to_atom(key), val}
    struct(Contact, attrs) |> Repo.insert()

    contacts = Contact |> Repo.all()
    socket = socket |> assign(contacts: contacts)
    {:noreply, socket}
  end
end
