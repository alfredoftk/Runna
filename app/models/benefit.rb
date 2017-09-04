class Benefit < ApplicationRecord

  belongs_to :region
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"
  has_many :company_benefits
  has_many :companies, through: :company_benefits
  has_many :benefit_details

  validates :name, presence: true

end
