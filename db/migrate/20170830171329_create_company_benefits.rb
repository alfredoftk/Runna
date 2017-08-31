class CreateCompanyBenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :company_benefits do |t|
      t.references :benefit, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
