class BenefitDetail < ApplicationRecord

  belongs_to :benefit

  validates :name, :value, presence: true

end
