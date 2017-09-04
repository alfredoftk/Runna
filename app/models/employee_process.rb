class EmployeeProcess < ApplicationRecord
  belongs_to :company
  belongs_to :process_step
  belongs_to :employee
  has_many :process_company_fields
end
