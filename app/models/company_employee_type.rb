class CompanyEmployeeType < ApplicationRecord

  belongs_to :company
  belongs_to :employee_type

end
