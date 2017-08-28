class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.string :title, null: false
      t.string :key, null: false
      t.text :description, null: true
      t.integer :created_by_id, foreign_key: { references: [:platform_users, :id] }, null: true
      t.integer :updated_by_id, foreign_key: { references: [:platform_users, :id] }, null: true

      t.timestamps
    end
    add_index :forms, :key, unique: true
  end
end
