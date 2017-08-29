class CreateFormFieldValidations < ActiveRecord::Migration[5.1]
  def change
    create_table :form_field_validations do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :message, null: false
      t.json :options, null: false, default: {}
      t.references :form_field, foreign_key: true, null: false

      t.timestamps
    end
  end
end
