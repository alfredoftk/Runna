class CreateFormValidations < ActiveRecord::Migration[5.1]
  def change
    create_table :form_validations do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :error_message, null: false
      t.json :options, null: true

      t.timestamps
    end
  end
end
