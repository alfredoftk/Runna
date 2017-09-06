class Employee < ApplicationRecord
  belongs_to :company_user
  has_many :employee_fields
  has_one :process_step
  enum status: { inactive: 'inactive', in_progress: 'in_progress', active: 'active'  }
end
