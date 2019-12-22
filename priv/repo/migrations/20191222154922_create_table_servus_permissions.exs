defmodule Servus.Repo.Migrations.CreateTableServusPermissions do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:servus_permissions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :description, :string, null: false
      add :status, :string, null: false, default: "active"

      timestamps()
    end

    create_if_not_exists unique_index(:servus_permissions, [:name], name: :servus_permissions_name_index)
  end
end
