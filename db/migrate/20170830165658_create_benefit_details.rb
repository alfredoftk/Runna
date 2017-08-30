class CreateBenefitDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :benefit_details do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.references :benefit, foreign_key: true

      t.timestamps
    end
  end
end
