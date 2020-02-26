defmodule App.Components.Admin.Button do
  use Phoenix.LiveComponent
  use App.Properties

  @default %{
    classes: [],
    label: "Botão",
    type: "submit",
    icon: %{name: nil, position: "left"}
  }

  def preload(assigns_list) do
    assigns_list
    |> Enum.map(fn assigns ->
      assigns
      |> Map.put(:classes, get(assigns, :classes))
      |> Map.put(:label, get(assigns, :label))
      |> Map.put(:type, get(assigns, :type))
      |> Map.put(:icon, get(assigns, :label))
    end)
  end

  def render(%{socket: %Phoenix.LiveView.Socket{}} = assigns) do
    ~L"""
    <button type="<%= @type %>" class="btn <%= @classes %>">
      <%= @label %>
    </button>
    """
  end
end
