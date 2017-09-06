class EmployeeProcessField < ApplicationRecord
  belongs_to :employee_process
  belongs_to :form
  belongs_to :company_form_field
  has_one :form_field, through: :company_form_field

  def field_name
    form_field.name
  end
  

  def self.find_create_or_update(form, company_form_field, value)
    record = EmployeeProcessField.find_or_initialize_by(form: form, company_form_field:  company_form_field)
    record.value = value
    record.save!
  end

end
