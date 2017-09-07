class CreateCompanySalaryTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :company_salary_types do |t|
      t.references :company, foreign_key: true
      t.references :salary_type, foreign_key: true

      t.timestamps
    end
  end
end
