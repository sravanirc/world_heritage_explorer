defmodule WorldHeritageExplorerWeb.FilterFormComponent do
  use WorldHeritageExplorerWeb, :live_component
  import Flop.Phoenix, only: [filter_fields: 1]

  attr :fields, :list, required: true
  attr :meta, Flop.Meta, required: true
  attr :id, :string, default: nil
  attr :on_change, :string, default: "update-filter"
  attr :target, :string, default: nil

  def render(assigns) do
    assigns = assign(assigns, form: Phoenix.Component.to_form(assigns.meta), meta: nil)

    ~H"""
    <div>
      <.form
        class="inline-block"
        for={@form}
        id={@id}
        phx-target={@target}
        phx-change={@on_change}
        phx-submit={@on_change}
      >
        <.filter_fields :let={i} form={@form} fields={@fields}>
          <div class="flex items-center">
            <label for={i.field.id} class="mr-2">{i.label}</label>
            <.input field={i.field} type={i.type} phx-debounce={120} {i.rest} class="inline-block" />
          </div>
        </.filter_fields>
      </.form>
    </div>
    """
  end
end
