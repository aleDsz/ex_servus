defmodule Servus.Modules.ServusUsers do
  @moduledoc """
  The Servus users context
  """
  import Ecto.Query

  alias Servus.Repo
  alias Servus.Schemas.ServusUser

  @doc """
  Retrieve one user by ID
  """
  def get(user_id) when is_binary(user_id) do
    from(
      m in ServusUser,
      where: m.id == ^user_id
    )
    |> Repo.one()
    |> case do
      nil ->
        {:error, :not_found}

      user ->
        {:ok, user}
    end
  end

  @doc """
  Retrieve one user by email
  """
  def get_by_email(email) when is_binary(email) do
    from(
      m in ServusUser,
      where: m.email == ^email
    )
    |> Repo.one()
    |> case do
      nil ->
        {:error, :not_found}

      user ->
        {:ok, user}
    end
  end

  @doc """
  Creates a new user
  """
  def create(params) do
    %ServusUser{}
    |> ServusUser.changeset(params)
    |> Repo.insert()
  end
end
