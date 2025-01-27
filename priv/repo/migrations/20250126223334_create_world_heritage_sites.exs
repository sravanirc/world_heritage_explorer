defmodule WorldHeritageExplorer.Repo.Migrations.CreateWorldHeritageSites do
  use Ecto.Migration

  def change do
    create table(:world_heritage_sites) do
      add :unique_number, :integer
      add :id_no, :integer
      add :rev_bis, :string
      add :name_en, :string
      add :name_fr, :string
      add :name_es, :string
      add :name_ru, :string
      add :name_ar, :string
      add :name_zh, :string
      add :short_description_en, :text
      add :short_description_fr, :text
      add :short_description_es, :text
      add :short_description_ru, :text
      add :short_description_ar, :text
      add :short_description_zh, :text
      add :justification_en, :text
      add :justification_fr, :text
      add :date_inscribed, :string
      add :secondary_dates, :string
      add :danger, :string
      add :date_end, :string
      add :danger_list, :string
      add :longitude, :float
      add :latitude, :float
      add :area_hectares, :float
      add :c1, :boolean
      add :c2, :boolean
      add :c3, :boolean
      add :c4, :boolean
      add :c5, :boolean
      add :c6, :boolean
      add :n7, :boolean
      add :n8, :boolean
      add :n9, :boolean
      add :n10, :boolean
      add :criteria_txt, :text
      add :category, :string
      add :category_short, :string
      add :states_name_en, :string
      add :states_name_fr, :string
      add :states_name_es, :string
      add :states_name_ru, :string
      add :states_name_ar, :string
      add :states_name_zh, :string
      add :region_en, :string
      add :region_fr, :string
      add :iso_code, :string
      add :udnp_code, :string
      add :transboundary, :boolean

      timestamps()
    end
  end
end
