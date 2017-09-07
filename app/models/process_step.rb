class ProcessStep < ApplicationRecord
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "PlatformUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "PlatformUser"
  belongs_to :form
  has_many :employee_processes
  enum status: { inactive: 'inactive', active: 'active'  }

  def step_1?
    return order == 1
  end




end
