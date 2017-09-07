class CreateCompanyAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :company_areas do |t|
      t.references :company, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
