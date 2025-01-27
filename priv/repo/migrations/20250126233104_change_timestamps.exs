defmodule WorldHeritageExplorer.Repo.Migrations.ChangeTimestamps do
  use Ecto.Migration

  def up do
    execute """
    ALTER TABLE world_heritage_sites
    ALTER COLUMN inserted_at SET DEFAULT NOW(),
    ALTER COLUMN updated_at SET DEFAULT NOW();
    """

    execute """
    COPY world_heritage_sites (
    unique_number, id_no, rev_bis, name_en, name_fr, name_es, name_ru, name_ar, name_zh,
    short_description_en, short_description_fr, short_description_es, short_description_ru,
    short_description_ar, short_description_zh, justification_en, justification_fr,
    date_inscribed, secondary_dates, danger, date_end, danger_list, longitude, latitude,
    area_hectares, C1, C2, C3, C4, C5, C6, N7, N8, N9, N10, criteria_txt,
    category, category_short, states_name_en, states_name_fr, states_name_es,
    states_name_ru, states_name_ar, states_name_zh, region_en, region_fr,
    iso_code, udnp_code, transboundary
    ) FROM '/tmp/whc-sites.csv' WITH (FORMAT csv, HEADER true);
    """

    execute """
    ALTER TABLE world_heritage_sites
    ALTER COLUMN inserted_at DROP DEFAULT,
    ALTER COLUMN updated_at DROP DEFAULT;
    """
  end

  def down do
    execute "TRUNCATE world_heritage_sites;"
  end
end
