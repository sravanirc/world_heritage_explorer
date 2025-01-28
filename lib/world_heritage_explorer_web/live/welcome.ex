defmodule WorldHeritageExplorerWeb.WelcomeLive do
  use WorldHeritageExplorerWeb, :live_view
  alias WorldHeritageExplorerWeb.FlopConfig
  alias WorldHeritageExplorerWeb.FilterFormComponent
  alias WorldHeritageExplorer.WorldHeritageSite
  import Phoenix.HTML.Form
  alias Flop.Phoenix, as: FlopPhoenix

  @impl true
  def mount(_params, _session, socket) do
    params = %{
      "page" => 1,
      "page_size" => 10
    }

    case WorldHeritageSite.get_all_world_heritage_sites(params) do
      {:ok, {all_sites, meta}} ->
        {:ok,
         socket
         |> assign(:world_heritage_sites, all_sites)
         |> assign(:page, 1)
         |> assign(:page_size, 10)
         |> assign(:meta, meta)
         |> assign(:fields, [%{field: :region_en, label: "Region", type: "text"}])}

      {:error, _reason} ->
        {:ok,
         socket
         |> assign(:world_heritage_sites, [])
         |> assign(:page, 1)
         |> assign(:page_size, 10)
         |> assign(:meta, %Flop.Meta{})
         |> assign(:fields, [%{field: :region_en, label: "Region", type: "text"}])
         |> put_flash(:error, "Unable to load all sites")}
    end
  end

  @impl true
  def handle_event("change_page_size", %{"page_size" => page_size}, socket) do
    params = %{
      "page" => 1,
      "page_size" => String.to_integer(page_size)
    }

    case WorldHeritageSite.get_all_world_heritage_sites(params) do
      {:ok, {all_sites, meta}} ->
        updated_socket =
          socket
          |> assign(:world_heritage_sites, all_sites)
          |> assign(:meta, meta)
          |> assign(:page_size, page_size)
          |> assign(:page, 1)
          |> put_flash(:info, "Page size changed to #{page_size}")

        {:noreply, updated_socket}

      {:error, reason} ->
        socket
        |> put_flash(:error, "Unable to change page size: #{reason}")

        {:noreply, socket}
    end
  end

  @impl true
  def handle_event("update-filter", %{"filters" => filters, "page_size" => page_size}, socket) do

    params = %{
      "filters" => filters,
      "page_size" => page_size,
      "page" => "1"
    }

    case WorldHeritageSite.get_all_world_heritage_sites(params) do
      {:ok, {all_sites, meta}} ->
        {:noreply,
          socket
          |> assign(:world_heritage_sites, all_sites)
          |> assign(:meta, meta)
          |> assign(:page_size, page_size)
          |> put_flash(:info, "Filter updated")}
      {:error, reason} ->

        socket
        |> put_flash(:error, "Unable to update filter: #{reason}")

        {:noreply, socket}
  end
  end

  @impl true
  def handle_params(params, _uri, socket) do

    case WorldHeritageSite.get_all_world_heritage_sites(params) do
      {:ok, {all_sites, meta}} ->
        updated_socket =
          socket
          |> assign(:world_heritage_sites, all_sites)
          |> assign(:meta, meta)
          |> assign(:page, params["page"])
          |> assign(:page_size, params["page_size"])

        {:noreply, updated_socket}

      {:error, reason} ->
        socket
        |> put_flash(:error, "#{reason}")

        {:noreply, socket}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <h1 class=" flex justify-center">World Heritage Explorer</h1>

    <h2>Welcome to the World Heritage Explorer!</h2>
    <p>
     Discover and explore UNESCO World Heritage Sites with ease. Search by region, adjust rows per page, and view detailed site information such as descriptions, locations, and categories.
    </p>
    <p>
    Enjoy seamless navigation with live updates and intuitive pagination. Start exploring the world's cultural and natural treasures today!
    </p>
    <div class="p-5 grid justify-center rounded-lg overflow-auto">
      <div class="flex justify-between items-center p-3 w-full">
        <.live_component
          class="flex"
          module={FilterFormComponent}
          fields={[region_en: [type: "text", label: "Search by Region: "]]}
          meta={@meta}
          path={~p"/"}
          id="all-sites-filter-form"
        />

        <div>
          <form phx-change="change_page_size">
            <label for="page_size">Rows per page:</label>
            <select id="page_size" name="page_size" class="p-2 px-5 border rounded-lg">
              {options_for_select([{"10", 10}, {"30", 30}, {"50", 50}, {"100", 100}], @page_size)}
            </select>
          </form>
        </div>


        <%= if @meta.total_pages > 1 do %>
          <FlopPhoenix.pagination meta={@meta} path={~p"/"} opts={FlopConfig.pagination_style()} />
        <% end %>
      </div>

      <Flop.Phoenix.table
        items={@world_heritage_sites}
        meta={@meta}
        path={~p"/"}
        opts={FlopConfig.table_style()}
        id="world_heritage_sites_table"
      >
        <:col :let={site} label="Name (English)" field={:name_en}>
          {site.name_en}
        </:col>

        <:col :let={site} label="Short Description (English)" field={:short_description_en}>
           <%= raw(site.short_description_en) %>
        </:col>

        <:col :let={site} label="Date Inscribed" field={:date_inscribed}>
          {site.date_inscribed}
        </:col>

        <:col :let={site} label="Latitude" field={:latitude}>
          {site.latitude}
        </:col>

        <:col :let={site} label="Longitude" field={:longitude}>
          {site.longitude}
        </:col>

        <:col :let={site} label="Area (Hectares)" field={:area_hectares}>
          {site.area_hectares}
        </:col>

        <:col :let={site} label="Category" field={:category}>
          {site.category}
        </:col>

        <:col :let={site} label="Region (English)" field={:region_en}>
          {site.region_en}
        </:col>

        <:col :let={site} label="ISO Code" field={:iso_code}>
          {site.iso_code}
        </:col>

        <:col :let={site} label="Unique Number" field={:unique_number}>
          {site.unique_number}
        </:col>
      </Flop.Phoenix.table>

    <!-- Pagination Footer -->
      <%= if @meta.total_pages > 1 do %>
        <FlopPhoenix.pagination meta={@meta} path={~p"/"} opts={FlopConfig.pagination_style()} />
      <% end %>
    </div>
    """
  end
end
