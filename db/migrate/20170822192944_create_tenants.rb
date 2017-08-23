class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.string :custom_fqdn, null: false
      t.integer :created_by, foreign_key: { references: [:users, :id] }, null: false
      t.integer :updated_by, foreign_key: { references: [:users, :id] }, null: false

      t.timestamps
    end
  end
end
