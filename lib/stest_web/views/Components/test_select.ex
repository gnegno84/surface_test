defmodule StestWeb.Components.Form.TestSelect do
  use Surface.Component

  alias Surface.Components.Form.Select

  prop selected, :string, required: true
  prop options, :list, required: true
  prop prompt, :string, default: nil
  prop is_selected, :boolean, default: false

  def render(assigns) do
    ~H"""
    <Select class={{ "is-valid": @is_selected }} options={{ @options }} opts={{ selected: @selected }} prompt={{@prompt}} />
    """
  end
end
