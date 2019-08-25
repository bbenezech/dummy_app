class CreateUnscopedPages < ActiveRecord::Migration[4.2]
  def change
    create_table :unscoped_pages do |t|
      t.string :title

      t.timestamps
    end
  end
end
