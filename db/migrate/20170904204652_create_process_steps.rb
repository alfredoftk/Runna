class CreateProcessSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :process_steps do |t|
      t.string :name, null: false
      t.string :description, null: true
      t.string :status, default: 'inactive'
      t.integer :order, null: false, default: 0
      t.references :form, foreign_key: true, null: false
      t.string :key, null: false, unique: true
      t.integer :created_by_id, foreign_key: { references: [:platform_users, :id] }, null: true
      t.integer :updated_by_id, foreign_key: { references: [:platform_users, :id] }, null: true

      t.timestamps
    end
  end
end
