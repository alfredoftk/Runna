class EmployeeType < ApplicationRecord
  belongs_to :region
  belongs_to :company
end
