defmodule Servus.Repo.Migrations.CreateTableServusProfilePermissions do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:servus_profile_permissions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :servus_profile_id, references(:servus_profiles, type: :binary_id), null: false
      add :servus_permission_id, references(:servus_permissions, type: :binary_id), null: false

      timestamps()
    end

    create_if_not_exists unique_index(:servus_profile_permissions, [:servus_profile_id, :servus_permission_id], name: :servus_profile_permissions_unique_index)
  end
end
