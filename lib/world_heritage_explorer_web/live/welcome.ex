defmodule WorldHeritageExplorerWeb.WelcomeLive do
  use WorldHeritageExplorerWeb, :live_view
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
  def render(assigns) do
    ~H"""
    <h1>Welcome to the World Heritage Explorer</h1>
    """
  end
  end
