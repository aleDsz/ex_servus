defmodule Servus.Services.ServusUsers do
  @moduledoc """
  The Servus users service
  """
  alias Servus.Modules.ServusUsers

  @doc """
  Retrieve one user by ID
  """
  def get(user_id) when is_binary(user_id) do
    case ServusUsers.get(user_id) do
      {:ok, user} ->
        {:ok, user}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Retrieve one user by email
  """
  def get_by_email(email) when is_binary(email) do
    case ServusUsers.get_by_email(email) do
      {:ok, user} ->
        {:ok, user}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Creates a new user
  """
  def create(params) when is_map(params) do
    case ServusUsers.create(params) do
      {:ok, user} ->
        {:ok, user}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
