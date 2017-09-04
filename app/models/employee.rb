class Employee < ApplicationRecord
  belongs_to :company_user
  has_many :employee_fields
  has_one :process_step
  enum status: { inactive: 0, in_progress: 1, active: 0  }
end
