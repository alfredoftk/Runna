class CreateFormFields < ActiveRecord::Migration[5.1]
  def change
    create_table :form_fields do |t|
      t.string :display_name, null: false
      t.string :help_text, null: true
      t.string :name, null: false
      t.string :input_data_source, null: true
      t.string :data_type, null: false
      t.json :widget_attributes, null: false, default: {}
      t.string :widget_type, null: false, default: 'text'
      t.boolean :required, null: false, default: false
      t.integer :field_order, null: false
      t.json :render_if, null: true
      t.string :depends_on, null: true
      t.references :form_section, foreign_key: true, null: false
      t.references :region, foreign_key: true, null: true
      t.integer :created_by_id, foreign_key: { references: [:platform_users, :id] }, null: true
      t.integer :updated_by_id, foreign_key: { references: [:platform_users, :id] }, null: true

      t.timestamps
    end
    add_index :form_fields, [:name, :form_section_id], unique: true
  end
end
