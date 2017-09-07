class CreateSalaryTypeDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :salary_type_details do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.references :salary_type, foreign_key: true
      t.integer :company_owner_id, foreign_key: { references: [:companies, :id] }, null: true

      t.timestamps
    end
  end
end
