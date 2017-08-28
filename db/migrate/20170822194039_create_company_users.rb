class CreateCompanyUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :company_users do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.string :password_digest
			t.integer :created_by_id, foreign_key: { references: [:company_users, :id] }
      t.integer :updated_by_id, foreign_key: { references: [:company_users, :id] }
      
      t.timestamps
    end
  end
end
