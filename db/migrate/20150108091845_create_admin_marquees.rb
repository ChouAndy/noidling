class CreateAdminMarquees < ActiveRecord::Migration
  def change
    create_table :admin_marquees do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
