class RenameLeagueIdForeignKeyOnDivisions < ActiveRecord::Migration[4.2]
  def change
    rename_column :divisions, :league_id, :custom_league_id
  end
end
