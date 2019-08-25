class AddProperAttachmentToUsers < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_updated_at
    add_attachment :users, :avatar
  end

  def self.down
    remove_attachment :users, :avatar
    add_column :users, :avatar_file_name,    :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size,    :integer
    add_column :users, :avatar_updated_at,   :datetime
  end
end
