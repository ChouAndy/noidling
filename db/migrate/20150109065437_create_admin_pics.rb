class CreateAdminPics < ActiveRecord::Migration
  def change
    create_table :admin_pics do |t|
      t.belongs_to :admin_activity, index: true
      t.attachment :pic

      t.timestamps null: false
    end
    add_foreign_key :admin_pics, :admin_activities
  end
end
