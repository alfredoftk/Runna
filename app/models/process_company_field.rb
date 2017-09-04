class ProcessCompanyField < ApplicationRecord
  belongs_to :employee_process
  belongs_to :form
  belongs_to :company_form_field
  has_one :form_field, through: :company_form_field
end
