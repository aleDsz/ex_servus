defmodule Servus.Repo.Migrations.CreateTableServusProfiles do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:servus_profiles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :status, :string, null: false, default: "active"

      timestamps()
    end

    create_if_not_exists unique_index(:servus_profiles, [:name], name: :servus_profiles_name_index)
  end
end
