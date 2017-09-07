class CreateCompanyEmployeeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :company_employee_types do |t|
      t.references :employee_type, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
