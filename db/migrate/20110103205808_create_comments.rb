class CreateComments < ActiveRecord::Migration[4.2]
  def self.up
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
