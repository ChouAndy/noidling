class CreateAdminCounters < ActiveRecord::Migration
  def change
    create_table :admin_counters do |t|
      t.integer :category
      t.integer :number, default: 0

      t.timestamps null: false
    end
    Admin::Counter.create(category: 7, number: 0)
  end
end
