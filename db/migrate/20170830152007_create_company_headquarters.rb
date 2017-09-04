class CreateCompanyHeadquarters < ActiveRecord::Migration[5.1]
  def change
    create_table :company_headquarters do |t|
      t.references :company, foreign_key: true
      t.references :headquarter, foreign_key: true

      t.timestamps
    end
  end
end
