defmodule App.Properties do
  defmacro __using__(_) do
    Module.register_attribute(__CALLER__.module, :default, accumulate: true, persist: false)

    quote do
      defp get_default(), do: @default |> List.first()

      defp get(assigns, :classes) when is_map(assigns), do:
        if Map.has_key?(assigns, :classes),
          do: Map.get(assigns, :classes) |> Enum.join(" "),
          else: Map.get(@default, :classes) |> Enum.join(" ")

      defp get(assigns, field) when is_map(assigns) and is_atom(field), do:
        if Map.has_key?(assigns, field),
          do: Map.get(assigns, field),
          else: Map.get(get_default(), field)
    end
  end
end
