class CreateCompanyDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :company_documents do |t|
      t.references :company, foreign_key: true
      t.references :document, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
