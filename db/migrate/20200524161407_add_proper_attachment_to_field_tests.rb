class AddProperAttachmentToFieldTests < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :field_tests, :paperclip_asset_file_name
    remove_column :field_tests, :paperclip_asset_content_type
    remove_column :field_tests, :paperclip_asset_file_size
    remove_column :field_tests, :paperclip_asset_updated_at
    add_attachment :field_tests, :paperclip_asset
  end

  def self.down
    remove_attachment :field_tests, :paperclip_asset
    add_column :field_tests, :paperclip_asset_file_name,    :string
    add_column :field_tests, :paperclip_asset_content_type, :string
    add_column :field_tests, :paperclip_asset_file_size,    :integer
    add_column :field_tests, :paperclip_asset_updated_at,   :datetime
  end
end
