class CreateFormFields < ActiveRecord::Migration[5.1]
  def change
    create_table :form_fields do |t|
      t.string :display_name, null: false
      t.string :help_text, null: true
      t.string :name, null: false
      t.string :input_data_source, null: true
      t.string :data_type, null: false
      t.json :widget_attributes, null: true
      t.string :widget_type, null: true
      t.boolean :required, null: false, default: false
      t.integer :field_order, null: false
      t.references :form_section, foreign_key: true, null: false
      t.references :region, foreign_key: true, null: true
      t.integer :created_by_id, foreign_key: { references: [:platform_users, :id] }, null: true
      t.integer :updated_by_id, foreign_key: { references: [:platform_users, :id] }, null: true

      t.timestamps
    end
  end
end
