defmodule StestWeb.TestView do
  use Surface.LiveView

  alias Surface.Components.Form
  alias Surface.Components.Form.{Field, Label, Select, TextInput}

  alias StestWeb.Components.Form.{TestSelect}

  data test_data, :map, default: %{}

  @impl true
  def render(assigns) do
    ~H"""

      <div class="box">
        <h3> Test select </h3>

        <Form for={{ :test_data }} change="update_params" submit="confirm" opts={{ autocomplete: "off" }}>
            <Field name="input_data">
              <Label class="claim-label">Test input</Label>
              <div data-control>
                <TextInput id="input_data" value={{@test_data["input_data"]}} />
              </div>
            </Field>

            <Field name="simple_select">
              <div data-control>
                <TestSelect
                  selected={{@test_data["simple_select"]}}
                  prompt="I am a custom select" options={{get_options()}}
                  is_selected={{ is_selected("CustomSelect", @test_data["simple_select"]) }}
                />
              </div>
            </Field>

            <Field name="surface_select">
              <div data-control>
                <Select
                  id="surface_select"
                  class={{ "is-valid": is_selected("SurfaceSelect", @test_data["surface_select"]) }}
                  options={{ get_options() }}
                  opts={{ selected: @test_data["surface_select"] }}
                  prompt="I am the surface select component"
                />
            </div>
            </Field>

          <p> Custom Select -> is selected: {{is_selected("CustomSelect", @test_data["simple_select"])}} </p>
          <p> Surface Select -> is selected: {{@test_data["surface_select"] != ""}} </p>
          <p> {{inspect(@test_data)}} </p>
          <button class="btn btn--primary">Submit</button>
        </Form>
      </div>
    """
  end

  @impl true
  def handle_event("update_params", %{"test_data" => params}, socket) do
    {:noreply, assign(socket, :test_data, params)}
  end

  def handle_event("confirm", _, socket) do
    {:noreply, socket}
  end

  defp is_selected(source, nil), do: false
  defp is_selected(source, ""), do: false
  defp is_selected(source, _), do: true

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
