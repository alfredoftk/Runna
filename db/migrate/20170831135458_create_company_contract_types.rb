class CreateCompanyContractTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :company_contract_types do |t|
      t.references :company, foreign_key: true
      t.references :contract_type, foreign_key: true

      t.timestamps
    end
  end
end
