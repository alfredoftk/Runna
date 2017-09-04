class EmployeeType < ApplicationRecord

  belongs_to :region
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"
  has_many :company_employee_types
  has_many :companies, through: :company_employee_types
  has_many :employee_type_details

  validates :name, presence: true

end
