class CreateEmployeeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :employee_types do |t|
      t.string :name, null: false
      t.references :region, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
