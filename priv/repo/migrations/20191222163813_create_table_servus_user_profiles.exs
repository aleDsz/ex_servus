defmodule Servus.Repo.Migrations.CreateTableServusUserProfiles do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:servus_user_profiles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :servus_user_id, references(:servus_users, type: :binary_id), null: false
      add :servus_profile_id, references(:servus_profiles, type: :binary_id), null: false

      timestamps()
    end

    create_if_not_exists unique_index(:servus_user_profiles, [:servus_user_id, :servus_profile_id], name: :servus_user_profiles_unique_index)
  end
end
