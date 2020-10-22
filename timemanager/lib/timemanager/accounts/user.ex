defmodule Timemanager.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Timemanager.Time.Clock

  schema "users" do
    field :email, :string
    field :username, :string
    has_many :clocks, Clock

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/@/)
  end
end
