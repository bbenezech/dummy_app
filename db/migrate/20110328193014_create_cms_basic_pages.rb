class CreateCmsBasicPages < ActiveRecord::Migration[4.2]
  def self.up
    create_table :cms_basic_pages do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :cms_basic_pages
  end
end
