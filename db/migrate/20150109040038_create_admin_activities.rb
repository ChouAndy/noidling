class CreateAdminActivities < ActiveRecord::Migration
  def change
    create_table :admin_activities do |t|
      t.string :name
      t.string :subject
      t.string :sponsor
      t.string :cosponsor
      t.date :hold_date
      t.time :start_time
      t.time :end_time
      t.string :site
      t.text :achievement

      t.timestamps null: false
    end
  end
end
