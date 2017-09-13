class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.text :description, null: true
      t.boolean :allow_update, null: false, default: false
      t.references :region, foreign_key: true
      t.integer :company_owner_id, foreign_key: { references: [:companies, :id] }, null: true
      t.string :type, null: false

      t.timestamps
    end
  end
end
