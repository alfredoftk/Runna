class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :family_name, null: false
      t.string :additional_family_name, null: false
      t.references :platform_user, foreign_key: true

      t.timestamps
    end
  end
end
