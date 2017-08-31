class CreateEmployeeTypeCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_type_companies do |t|
      t.references :employee_type, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
