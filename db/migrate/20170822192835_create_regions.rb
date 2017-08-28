class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :name, null: false
      t.string :key, null: false
      t.integer :parent_id, foreign_key: { references: [:regions, :id] }, null: true
      t.integer :created_by_id, foreign_key: { references: [:platform_users, :id] }, null: true
      t.integer :updated_by_id, foreign_key: { references: [:platform_users, :id] }, null: true

      t.timestamps
    end
    add_index :regions, :name, unique: true
    add_index :regions, :key, unique: true
  end
end
