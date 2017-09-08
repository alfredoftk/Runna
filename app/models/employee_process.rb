class EmployeeProcess < ApplicationRecord
  belongs_to :company
  belongs_to :process_step
  belongs_to :employee
  has_many :employee_process_fields
  has_many :employee_fields, through: :employee

  def update_process_step
    if process_step_id < ProcessStep.count
      self.process_step_id = process_step.next_step
      self.save
    end
  end
end
