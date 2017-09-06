class Company < ApplicationRecord

  belongs_to :region
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "User"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "User"
  has_many :company_form_fields
  has_many :form_fields, through: :company_form_fields
  has_many :company_areas
  has_many :areas, through: :company_areas
  has_many :company_headquarters
  has_many :headquarters, through: :company_headquarters
  has_many :company_benefits
  has_many :benefits, through: :company_benefits
  has_many :company_contract_types
  has_many :contract_types, through: :company_contract_types
  has_many :company_employee_types
  has_many :employee_types, through: :company_employee_types
  has_many :company_work_shift
  has_many :work_shifts, through: :company_work_shift
  has_many :company_salary_types
  has_many :salary_types, through: :company_salary_types
  has_many :company_payroll_frequencies
  has_many :payroll_frequencies, through: :company_payroll_frequencies
  has_many :company_payroll_types
  has_many :payroll_types, through: :company_payroll_types
  has_many :company_banks
  has_many :banks, through: :company_banks
  has_many :employee_processes
  has_many :company_documents
  has_many :documents, through: :company_documents

  validates :name, :subdomain, :custom_fqdn, presence: true
  validates :subdomain, uniqueness: true

  def available_entity_fetcher entity
    entity = entity.underscore.pluralize
    self.send(entity).where("#{entity}.region_id = ? OR #{entity}.region_id IS NULL", self.region.id).where("#{entity}.company_owner_id = ? OR #{entity}.company_owner_id IS NULL", self.id)
  end

  def form_fields_by_form_id form_id
    self.form_fields.form_fields_by_form_id form_id
  end

end
