class CreateSuggestedEmployeeDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :suggested_employee_documents do |t|
      t.references :document, foreign_key: true, null: false
      t.references :employee, foreign_key: true, null: false
      t.timestamps
    end
  end
end
