class CreateCompanyBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :company_banks do |t|
      t.references :company, foreign_key: true
      t.references :bank, foreign_key: true

      t.timestamps
    end
  end
end
