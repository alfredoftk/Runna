class CompanyBenefitDetail < ApplicationRecord

  belongs_to :company_benefit

  validates :name, :value, presence: true

end
