class AddColorToTeamMigration < ActiveRecord::Migration[4.2]
  def self.up
    add_column :teams, :color, :string
  end

  def self.down
    remove_column :teams, :color
  end
end
