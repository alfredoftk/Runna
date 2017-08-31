class EmployeeTypeCompany < ApplicationRecord

  belongs_to :employee_type
  belongs_to :company

end
