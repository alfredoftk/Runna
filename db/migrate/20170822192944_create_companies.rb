class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.string :custom_fqdn, null: false
      t.references :region, foreign_key: true, null: false
      t.integer :created_by_id, foreign_key: { references: [:users, :id] }, null: true
      t.integer :updated_by_id, foreign_key: { references: [:users, :id] }, null: true

      t.timestamps
    end
    add_index :companies, :subdomain, unique: true
  end
end
