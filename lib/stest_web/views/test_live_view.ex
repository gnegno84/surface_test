defmodule StestWeb.TestLiveView do
  use StestWeb, :live_view

  use Phoenix.HTML
  import Phoenix.HTML.Form

  @default %{
    "input_data" => "",
    "select_1" => "",
    "select_2" => ""
  }

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, test_data: @default)}
  end

  @impl true
  def handle_event("update_params", %{"test_data" => params}, socket) do
    {:noreply, assign(socket, :test_data, params)}
  end

  def handle_event("confirm", _, socket) do
    IO.inspect(socket.assigns)
    {:noreply, socket}
  end

  defp is_selected(nil), do: false
  defp is_selected(""), do: false
  defp is_selected(_), do: true

  defp get_options() do
    [
      {"Key 1", "Value 1"},
      {"Key 2", "Value 2"},
      {"Key 3", "Value 3"},
      {"Key 4", "Value 4"},
      {"Key 5", "Value 5"}
    ]
  end
end
