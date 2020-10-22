defmodule Timemanager.Time.Clock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Timemanager.Accounts.User
  alias Timemanager.Repo

  schema "clocks" do
    field :status, :boolean, default: false
    field :time, :utc_datetime
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> Repo.preload(:user)
    |> cast(attrs, [:time, :status])
    |> validate_required([:time, :status])
  end
end
