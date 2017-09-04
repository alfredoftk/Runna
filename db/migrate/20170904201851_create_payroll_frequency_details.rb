class CreatePayrollFrequencyDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :payroll_frequency_details do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.references :payroll_frequency, foreign_key: true
      t.integer :company_owner_id, foreign_key: { references: [:companies, :id] }, null: true

      t.timestamps
    end
  end
end
