class Employee < ApplicationRecord

  belongs_to :company_user
  has_many :employee_fields
  has_one :employee_process

  enum status: { in_progress: 'in_progress', active: 'active', inactive: 'inactive'  }

end
