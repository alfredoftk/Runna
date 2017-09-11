class CreateEmployeeProcessFields < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_process_fields do |t|
      t.references :employee_process, foreign_key: true, null: false
      t.references :form, foreign_key: true, null: false
      t.references :company_form_field, foreign_key: true, null: false
      t.json :value, null: false, default: {}
      t.string :field_name, null: false, default: ''
      t.timestamps
    end
    add_index :employee_process_fields, [:employee_process_id, :form_id, :company_form_field_id],
              unique: true, name: "employee_process_index"
  end
end
