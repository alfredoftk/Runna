class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.belongs_to :company_user, foreign_key: true, null: false
      t.string :status, default: 'in_progress', null: false
      t.timestamps
    end
  end
end
