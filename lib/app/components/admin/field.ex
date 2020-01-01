defmodule App.Components.Admin.Field do
  use Phoenix.LiveComponent
  use App.Properties

  @default %{
    size: "s12",
    icon: "confirm",
    label: "Campo de texto",
    type: "text",
    error: nil
  }

  def preload(assigns_list) do
    assigns_list
    |> Enum.map(fn assigns ->
      assigns
      |> Map.put(:size, get(assigns, :size))
      |> Map.put(:icon, get(assigns, :icon))
      |> Map.put(:label, get(assigns, :label))
      |> Map.put(:type, get(assigns, :type))
      |> Map.put(:error, get(assigns, :error))
    end)
  end

  @doc false
  def handle_event("validation", %{"value" => value}, %Phoenix.LiveView.Socket{assigns: %{type: type}} = socket) do
    type = String.to_atom(type)

    case apply(App.Validators.Inputs, type, [value, socket]) do
      {:ok, value, %{assigns: assigns} = socket} ->
        case Map.get(assigns, type) do
          nil ->
            message =
              %{}
              |> Map.put(type, nil)
              |> Map.put(:message, Map.get(assigns, :message))

            send(self(), {:invalid_field, message})
            {:noreply, socket}

          _value ->
            message =
              %{}
              |> Map.put(type, value)
              |> Map.put(:message, nil)

            send(self(), {:valid_field, message})
            {:noreply, socket}
        end

      _ ->
        {:noreply, socket}
    end
  end

  @spec render(%{socket: Phoenix.LiveView.Socket.t()}) :: Phoenix.LiveView.Rendered.t()
  def render(%{socket: %Phoenix.LiveView.Socket{}} = assigns) do
    ~L"""
    <div class="input-field col <%= @size %>">
      <i class="material-icons prefix"><%= @icon %></i>
      <label for="<%= @id %>"><%= @label %></label>
      <input phx-keyup="validation" id="<%= @id %>" type="<%= @type %>" value="<%= @value %>" class= validate">
      <span class="red-text"><%= @error %></span>
    </div>
    """
  end
end
