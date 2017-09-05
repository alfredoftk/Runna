class CompanyFormField < ApplicationRecord

  belongs_to :company
  belongs_to :form_field
  has_many :employee_fields
  has_many :employee_process_fields

end
