class Document < ApplicationRecord

  belongs_to :region
  belongs_to :entity, polymorphic: true
  has_many :company_documents
  has_many :companies, through: :company_documents
  has_many :employee, through: :company_documents
  has_many :suggested_employee_documents
  has_many :employees, through: :suggested_employee_documents

  validates :name, presence: true

  def by_company_or_employee

  end

end
