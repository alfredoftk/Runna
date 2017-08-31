class CreateContractTypeCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :contract_type_companies do |t|
      t.references :company, foreign_key: true
      t.references :contract_type, foreign_key: true

      t.timestamps
    end
  end
end
