class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :family_name, null: false
      t.string :additional_family_name, null: false
      t.integer :created_by_id, foreign_key: { references: [:platform_users, :id] }
      t.integer :updated_by_id, foreign_key: { references: [:platform_users, :id] }

      t.timestamps
    end
  end
end
