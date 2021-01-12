defmodule StestWeb.Components.Form.TestButton do
  use Surface.Component

  prop loading, :boolean, default: false
  prop warning, :boolean, default: false
  slot default

  def render(assigns) do
    ~H"""
    <div>
    <button class={{ "button", "is-info", "is-loading": @loading, "btn--warning": @warning }}>
      <slot/>
    </button>
    <p>{{@loading}}</p>
    <p>{{@warning}}</p>
    </div>
    """
  end
end
