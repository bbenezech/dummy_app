class AddUniqueIndexNumberTeamIdInPlayers < ActiveRecord::Migration[6.0]
  def change
    add_index :players, %i[number team_id], unique: true
  end
end
