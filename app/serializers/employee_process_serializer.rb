class EmployeeProcessSerializer < ActiveModel::Serializer

  attributes :id, :employee_process_fields

  belongs_to :process_step
  has_many :employee_fields

  def employee_process_fields
    EmployeeProcessField.where(employee_process_id: object.id, form: object.process_step.form )
  end
end
