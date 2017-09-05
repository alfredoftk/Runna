class CreateHeadquarters < ActiveRecord::Migration[5.1]
  def change
    create_table :headquarters do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.references :region, foreign_key: true
      t.references :country, foreign_key: true
      t.integer :company_owner_id, foreign_key: { references: [:companies, :id] }, null: true

      t.timestamps
    end
  end
end
