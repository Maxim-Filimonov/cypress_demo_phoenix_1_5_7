defmodule CypressDemo.Factory do
  use ExMachina.Ecto, repo: CypressDemo.Repo

  def contact_factory do
    %CypressDemo.Contact{
      first_name: "Default",
      last_name: "User"
    }
  end
end
