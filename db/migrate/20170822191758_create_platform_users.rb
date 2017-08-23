class CreatePlatformUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :platform_users do |t|
      t.string :description, null: false

      t.timestamps
    end
  end
end
