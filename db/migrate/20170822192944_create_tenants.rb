class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.string :custom_fqdn, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
