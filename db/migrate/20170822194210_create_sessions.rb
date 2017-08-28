class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :access_token, null: false
      t.string :refresh_token, null: false
      t.datetime :expires_at, null: false
      t.references :company_user, foreign_key: true, null: false

      t.timestamps
    end
    add_index :sessions, :access_token, unique: true
    add_index :sessions, :refresh_token, unique: true
  end
end
