class CreateAdminKnowledges < ActiveRecord::Migration
  def change
    create_table :admin_knowledges do |t|
      t.string :question
      t.text :answer

      t.timestamps null: false
    end
  end
end
