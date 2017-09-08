class EmployeeProcess < ApplicationRecord
  belongs_to :company
  belongs_to :process_step
  belongs_to :employee
  has_many :employee_process_fields
  has_many :employee_fields, through: :employee

  def next_step
    if process_step_id != ProcessStep.last_step.id
      self.update(process_step: process_step.next_step)
    end
  end
end
