class SalaryType < ApplicationRecord

  belongs_to :region
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"
  has_many :company_salary_types
  has_many :companies, through: :company_salary_types
  has_many :salary_type_details

  validates :name, presence: true

end
