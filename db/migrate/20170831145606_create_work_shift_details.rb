class CreateWorkShiftDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :work_shift_details do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.references :work_shift, foreign_key: true
      t.integer :company_owner_id, foreign_key: { references: [:companies, :id] }, null: true

      t.timestamps
    end
  end
end
