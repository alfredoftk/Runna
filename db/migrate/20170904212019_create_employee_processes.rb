class CreateEmployeeProcesses < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_processes do |t|
      t.references :process_step,foreign_key: true, null: false
      t.references :company, foreign_key: true, null: false
      t.references :employee, foreign_key: true, null: true
      t.integer :created_by_id, foreign_key: { references: [:users, :id] }, null: true
      t.integer :updated_by_id, foreign_key: { references: [:users, :id] }, null: true

      t.timestamps
    end
  end
end
