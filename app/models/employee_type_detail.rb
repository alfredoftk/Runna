class EmployeeTypeDetail < ApplicationRecord

  belongs_to :employee_type
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"

  validates :name, :value, presence: true

end
