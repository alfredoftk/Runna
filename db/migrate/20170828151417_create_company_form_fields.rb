class CreateCompanyFormFields < ActiveRecord::Migration[5.1]
  def change
    create_table :company_form_fields do |t|
      t.references :company, foreign_key: true, null: false
      t.references :form_field, foreign_key: true, null: false

      t.timestamps
    end
  end
end
