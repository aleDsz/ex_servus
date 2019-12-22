defmodule Servus.Repo.Migrations.CreateTableServusSettings do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:servus_settings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :description, :string, null: false
      add :key, :string, null: false
      add :value, :string, null: false
      add :status, :string, null: false, default: "active"

      timestamps()
    end

    create_if_not_exists unique_index(:servus_settings, [:key, :status], name: :servus_settings_unique_index)
  end
end
