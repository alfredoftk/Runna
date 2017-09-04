class PayrollFrequency < ApplicationRecord

  belongs_to :region
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"
  has_many :company_payroll_frequencies
  has_many :companies, through: :company_payroll_frequencies
  has_many :payroll_frequency_details

  validates :name, presence: true

end
