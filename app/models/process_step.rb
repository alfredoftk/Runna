class ProcessStep < ApplicationRecord

  belongs_to :created_by, foreign_key: :created_by_id, class_name: 'PlatformUser'
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: 'PlatformUser'
  belongs_to :form
  has_many :employee_processes

  enum status: { inactive: 'inactive', active: 'active'  }

  def step_one?
    step_order == 1
  end

  def next_step
    ProcessStep.active.find_by(step_order: self.step_order + 1)
  end

  def self.first_step
    self.active.order('step_order ASC').first
  end

  def self.last_step
    self.active.order('step_order DESC').first
  end

end
