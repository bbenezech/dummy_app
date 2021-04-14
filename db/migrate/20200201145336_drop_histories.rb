class DropHistories < ActiveRecord::Migration[6.0]
  def up
    drop_table :rails_admin_histories
  end
end
