class CreateNews < ActiveRecord::Migration
  def change
    create_table :admin_news do |t|
      t.date :public_date
      t.string :title
      t.text :content
      t.integer :click, default: 0

      t.timestamps null: false
    end
  end
end
