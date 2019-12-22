defmodule Servus.Repo.Migrations.CreateTableServusUserPermissions do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:servus_user_permissions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :servus_user_id, references(:servus_users, type: :binary_id), null: false
      add :servus_permission_id, references(:servus_permissions, type: :binary_id), null: false

      timestamps()
    end

    create_if_not_exists unique_index(:servus_user_permissions, [:servus_user_id, :servus_permission_id], name: :servus_user_permissions_unique_index)
  end
end
