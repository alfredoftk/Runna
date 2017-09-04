class CreateCompanyPayrollFrequencies < ActiveRecord::Migration[5.1]
  def change
    create_table :company_payroll_frequencies do |t|
      t.references :company, foreign_key: true
      t.references :payroll_frequency, foreign_key: true

      t.timestamps
    end
  end
end
