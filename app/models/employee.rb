class Employee < ApplicationRecord

  belongs_to :company_user
  has_one :process_step
  has_many :employee_fields

  enum status: { inactive: 'inactive', in_progress: 'in_progress', active: 'active'  }

end
