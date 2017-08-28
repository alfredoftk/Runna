class CreateFormFieldValidations < ActiveRecord::Migration[5.1]
  def change
    create_table :form_field_validations do |t|
      t.references :form_field, foreign_key: true, null: false
      t.references :form_validation, foreign_key: true, null: false

      t.timestamps
    end
  end
end
