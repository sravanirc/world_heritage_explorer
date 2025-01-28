defmodule WorldHeritageExplorer.WorldHeritageSite do
  use Ecto.Schema
  import Ecto.Query
  alias WorldHeritageExplorer.Repo

  @derive {Flop.Schema,
           filterable: [:date_inscribed, :category, :name_en, :region_en],
           sortable: [:date_inscribed, :category, :name_en, :region_en],
           default_limit: 10}

  schema "world_heritage_sites" do
    field :date_inscribed, :string
    field :latitude, :float
    field :longitude, :float
    field :area_hectares, :float
    field :category, :string
    field :name_en, :string
    field :region_en, :string
    field :iso_code, :string
    field :unique_number, :integer

    field :short_description_en, :string

    timestamps()
  end

  def get_all_world_heritage_sites(params) do
    query = from(w in WorldHeritageExplorer.WorldHeritageSite)

    case Flop.validate_and_run(query, params,
           for: WorldHeritageExplorer.WorldHeritageSite,
           repo: Repo
         ) do
      {:ok, {sites, meta}} ->
        {:ok, {sites, meta}}

      {:error, _reason} ->
        {:error, "Unable to load all sites"}
    end
  end

  # def get_world_heritage_sites_by_country(country) do
  #   from(w in WorldHeritageExplorer.WorldHeritageSite,
  #     where: w.name_en == ^country
  #   )
  #   |> WorldHeritageExplorer.Repo.all()
  # end
end
