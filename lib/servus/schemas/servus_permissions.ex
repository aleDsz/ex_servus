defmodule Servus.Schemas.ServusPermission do
  @moduledoc """
  Schema for Servus Permissions table
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "servus_permissions" do
    field :name, :string
    field :description, :string
    field :status, :string, default: "active"

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = schema, attrs) when is_map(attrs) do
    schema
    |> cast(attrs, [:name, :description, :status])
    |> validate_required([:name, :description, :status])
  end
end
