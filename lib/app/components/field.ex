defmodule App.Components.Field do
  use Phoenix.LiveComponent
  use App.Properties

  @default %{
    size: "s12",
    icon: "confirm",
    label: "Campo de texto",
    type: "text"
  }

  def preload(assigns_list) do
    assigns_list
    |> Enum.map(fn assigns ->
      assigns
      |> Map.put(:size, get(assigns, :size))
      |> Map.put(:icon, get(assigns, :icon))
      |> Map.put(:label, get(assigns, :label))
      |> Map.put(:type, get(assigns, :type))
    end)
  end

  def render(%{socket: %Phoenix.LiveView.Socket{}} = assigns) do
    ~L"""
    <div class="input-field col <%= @size %>">
      <i class="material-icons prefix"><%= @icon %></i>
      <label for="<%= @id %>"><%= @label %></label>
      <input id="<%= @id %>" type="<%= @type %>" class= validate">
    </div>
    """
  end
end
