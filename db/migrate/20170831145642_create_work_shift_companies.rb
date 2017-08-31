class CreateWorkShiftCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :work_shift_companies do |t|
      t.references :company, foreign_key: true
      t.references :work_shift, foreign_key: true

      t.timestamps
    end
  end
end
