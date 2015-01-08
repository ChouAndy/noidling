class CreateAdminDownloads < ActiveRecord::Migration
  def change
    create_table :admin_downloads do |t|
      t.string :category
      t.string :title
      t.integer :download_type
      t.attachment :upload
      t.string :url
      t.string :url_file_name
      t.string :url_file_content_type
      t.string :url_file_size
      t.string :url_file_size_unit

      t.timestamps null: false
    end
  end
end
