class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :family_name, null: false
      t.string :additional_family_name, null: false
      t.integer :created_by, foreign_key: { references: [:platform_users, :id] }, null: false
      t.integer :updated_by, foreign_key: { references: [:platform_users, :id] }, null: false

      t.timestamps
    end
  end
end
