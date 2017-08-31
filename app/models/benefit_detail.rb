class BenefitDetail < ApplicationRecord

  belongs_to :benefit
  belongs_to :owner_company, foreign_key: :owner_company_id, class_name: "Company"

  validates :name, :value, presence: true

end
