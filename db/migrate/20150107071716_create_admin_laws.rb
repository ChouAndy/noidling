class CreateAdminLaws < ActiveRecord::Migration
  def change
    create_table :admin_laws do |t|
      t.string :name
      t.string :site_url
      t.string :word_url
      t.string :pdf_url

      t.timestamps null: false
    end
  end
end
