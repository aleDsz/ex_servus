defmodule Servus.Repo.Migrations.CreateTableServusUsers do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:servus_users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false
      add :status, :string, null: false, default: "active"

      timestamps()
    end

    create_if_not_exists unique_index(:servus_users, [:email], name: :servus_users_email_index)
  end
end
