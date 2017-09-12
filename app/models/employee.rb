class Employee < ApplicationRecord

  belongs_to :company_user
  has_many :employee_fields
  has_one :employee_process

  enum status: { in_progress: 'in_progress', active: 'active', inactive: 'inactive'  }

  def self.all_active_and_inactive
    self.where(status: [:active, :inactive]).order(id: :asc)
  end

  def personal_info
    EmployeeField.joins('LEFT JOIN company_form_fields ON company_form_fields.id = employee_fields.company_form_field_id')
        .joins('LEFT JOIN form_fields ON form_fields.id = company_form_fields.form_field_id')
        .where('employee_fields.employee_id = ?', self.id)
        .where('form_fields.name IN (?)', self.values_name)
  end

  def values_name
    ['name','family_name', 'birthdate', 'additional_family_name', 'employee_identifier',
     'profile_picture', 'personal_email', 'laboral_email', 'phone', 'job', 'area','headquarter',
     'monthly_amount', 'contract_start_date', 'contract_end_date' ]
  end

  def years_in_company
    start_date = self.employee_fields.where(field_name: 'contract_start_date').first
    end_date = self.employee_fields.where(field_name: 'contract_end_date').first
    unless start_date.nil? and end_date.nil?
      start_date = start_date.value.to_date
      end_date = end_date.value.to_date
      unless start_date > Time.now.year
        if end_date > start_date
          return start_date.year - Time.now.year
        else
          return start_date.year - end_date.year
        end
      end
    end
    return nil
  end
end