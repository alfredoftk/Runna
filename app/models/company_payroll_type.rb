class CompanyPayrollType < ApplicationRecord

  belongs_to :company
  belongs_to :payroll_type

end
