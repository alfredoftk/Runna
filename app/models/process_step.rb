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
    self.active.order_asc.first
  end

  def self.last_step
    self.active.order_desc.first
  end

  def self.previous_steps step
    self.active.order_asc.where('step_order < ?', step.step_order)
  end

  def self.order_asc
    self.order('step_order ASC')
  end

  def self.order_desc
    self.order('step_order DESC')
  end

end
