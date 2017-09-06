class EmployeeField < ApplicationRecord

  belongs_to :employee
  belongs_to :company_form_field

end
