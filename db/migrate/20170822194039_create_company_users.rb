class CreateCompanyUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :company_users do |t|
      t.references :company, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :password_digest, null: true
			t.integer :created_by_id, foreign_key: { references: [:company_users, :id] }, null: true
      t.integer :updated_by_id, foreign_key: { references: [:company_users, :id] }, null: true
      
      t.timestamps
    end
  end
end
