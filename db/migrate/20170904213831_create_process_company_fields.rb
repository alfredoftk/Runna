class CreateProcessCompanyFields < ActiveRecord::Migration[5.1]
  def change
    create_table :process_company_fields do |t|
      t.references :employee_process, foreign_key: true, null: false
      t.references :form, foreign_key: true, null: false
      t.references :company_form_field, foreign_key: true, null: false
      t.json :value, null: false, default: {}


      t.timestamps
    end
    add_index :process_company_fields, [:employee_process_id, :form_id, :company_form_field_id],
              unique: true, name: "process_company_index"

  end
end
