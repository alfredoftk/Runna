class EmployeeField < ApplicationRecord
  belongs_to :employee
  belongs_to :company_form_field

  def self.find_create_or_update(company_form_field, value)
    record = self.find_or_initialize_by(company_form_field:  company_form_field)
    record.value = value
    record.save!
  end
end
