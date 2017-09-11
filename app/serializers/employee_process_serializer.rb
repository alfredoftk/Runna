class EmployeeProcessSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :process_step, :employee_process_fields, :employee_fields, :meta
  belongs_to :process_step
  has_many :employee_fields

  def employee_process_fields
    serialized_employee_process_fields(EmployeeProcessField.where(employee_process_id: object.id, form: object.process_step.form ))
  end

  def meta
    meta_attributes = Hash.new
    meta_attributes[:form] = meta_form
    return meta_attributes
  end

  def meta_form
    {
      actions: {
        current_step: {
          continue_later: { url: continue_later_process_path(object.id), method: 'PUT' },
          submit: { url: process_path(object.id), method: 'PUT' }
        },
        previous_steps: meta_form_previous_steps
      }
    }
  end

  def meta_form_previous_steps
    previous_steps = ProcessStep.previous_steps(object.process_step)
    previous_steps_hash = Hash.new
    previous_steps.map do |previous_step|
      previous_steps_hash[previous_step.step_order.to_s] = { url: forms_process_path(object.id, previous_step.form_id), method: 'PUT' }
    end
    previous_steps_hash
  end

  private

  def serialized_employee_process_fields(employee_process_fields)
    employee_process_fields.map{ |employee_process_field| EmployeeProcessFieldSerializer.new(employee_process_field) }
  end

end
