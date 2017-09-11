class CreateEmployeeFields < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_fields do |t|
      t.references :company_form_field, foreign_key: true, null: false
      t.references :employee , foreign_key: true, null: false
      t.json :value, null: false, default: {}
      t.string :field_name, null: false, default: ''
      t.timestamps
    end
    add_index :employee_fields, [:company_form_field_id, :employee_id], unique: true

  end
end
