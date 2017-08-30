class Benefit < ApplicationRecord

  belongs_to :region
  has_many :benefit_details

  validates :name, presence: true

end
