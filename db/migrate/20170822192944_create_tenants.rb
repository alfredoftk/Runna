class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.string :custom_fqdn, null: false
      t.integer :created_by_id, foreign_key: { references: [:users, :id] }
      t.integer :updated_by_id, foreign_key: { references: [:users, :id] }

      t.timestamps
    end
    add_index :tenants, :subdomain, unique: true
  end
end
