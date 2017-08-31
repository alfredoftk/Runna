class Benefit < ApplicationRecord

  belongs_to :region
  belongs_to :owner_company, foreign_key: :owner_company_id, class_name: "Company"
  has_many :company_benefits
  has_many :benefit_details

  validates :name, presence: true

end
