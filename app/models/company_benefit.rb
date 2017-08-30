class CompanyBenefit < ApplicationRecord

  belongs_to :company
  has_many :company_benefit_details

  validates :name, presence: true

end
