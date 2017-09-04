class CompanyFormField < ApplicationRecord

  belongs_to :company
  belongs_to :form_field
  has_many :employee_fields
  has_many :process_company_fields

end
