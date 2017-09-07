class CompanyPayrollFrequency < ApplicationRecord

  belongs_to :company
  belongs_to :payroll_frequency

end
