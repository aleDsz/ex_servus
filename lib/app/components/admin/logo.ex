defmodule App.Components.Admin.Logo do
  use Phoenix.LiveComponent
  use App.Properties

  @default %{
    classes: []
  }

  def preload(assigns_list) do
    assigns_list
    |> Enum.map(fn assigns ->
      assigns
      |> Map.put(:classes, get(assigns, :classes))
    end)
  end

  def render(%{socket: %Phoenix.LiveView.Socket{}} = assigns) do
    ~L"""
    <div class="logo <%= @classes %>"></div>
    """
  end
end
