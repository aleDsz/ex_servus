defmodule Servus.Schemas.ServusUser do
  @moduledoc """
  Schema for Servus Users table
  """
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: ~w(id name email status)a}
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "servus_users" do
    field :name, :string
    field :email, :string
    field :password, :string
    field :status, :string, default: "active"

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = schema, attrs) when is_map(attrs) do
    schema
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> unique_constraint(:email, name: :servus_users_email_index)
    |> convert_password()
  end

  defp convert_password(changeset) do
    case get_field(changeset, :password) do
      nil ->
        changeset

      value ->
        put_change(changeset, :password, value |> Base.encode64())
    end
  end
end
