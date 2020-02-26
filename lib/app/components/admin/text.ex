defmodule App.Components.Admin.Text do
  use Phoenix.LiveComponent
  use App.Properties

  @default %{
    classes: [],
    value: "Texto"
  }

  def preload(assigns_list) do
    assigns_list
    |> Enum.map(fn assigns ->
      assigns
      |> Map.put(:classes, get(assigns, :classes))
      |> Map.put(:value, get(assigns, :value))
    end)
  end

  def render(%{socket: %Phoenix.LiveView.Socket{}} = assigns) do
    ~L"""
    <span class="text <%= @classes %>">
      <%= @value %>
    </span>
    """
  end
end
