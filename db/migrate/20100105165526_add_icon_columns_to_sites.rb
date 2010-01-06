class AddIconColumnsToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :icon_file_name,    :string
    add_column :sites, :icon_content_type, :string
    add_column :sites, :icon_file_size,    :integer
    add_column :sites, :icon_updated_at,   :datetime
  end

  def self.down
    remove_column :sites, :icon_file_name
    remove_column :sites, :icon_content_type
    remove_column :sites, :icon_file_size
    remove_column :sites, :icon_updated_at
  end
end
