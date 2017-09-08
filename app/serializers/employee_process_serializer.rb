class EmployeeProcessSerializer < ActiveModel::Serializer

  attributes :id, :employee_process_fields

  belongs_to :process_step
  has_many :employee_fields

  def employee_process_fields
    serialized_employee_process_fields(EmployeeProcessField.where(employee_process_id: object.id, form: object.process_step.form ))
  end

  private

  def serialized_employee_process_fields(employee_process_fields)
    employee_process_fields.map{ |employee_process_field| EmployeeProcessFieldSerializer.new(employee_process_field) }
  end

end
