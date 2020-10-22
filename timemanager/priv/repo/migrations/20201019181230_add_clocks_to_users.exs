defmodule Timemanager.Repo.Migrations.AddClocksToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :clocks_id, references(:clocks, on_delete: :delete_all, null: true)
    end
  end
end
