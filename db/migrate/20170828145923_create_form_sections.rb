class CreateFormSections < ActiveRecord::Migration[5.1]
  def change
    create_table :form_sections do |t|
      t.string :title, null: true
      t.string :key, null: false
      t.text :description, null: true
      t.integer :section_order, null: false
      t.references :form, foreign_key: true, null: false
      t.integer :created_by_id, foreign_key: { references: [:platform_users, :id] }, null: true
      t.integer :updated_by_id, foreign_key: { references: [:platform_users, :id] }, null: true

      t.timestamps
    end
    add_index :form_sections, :key, unique: true
  end
end
