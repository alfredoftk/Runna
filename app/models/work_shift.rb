class WorkShift < ApplicationRecord

  belongs_to :region
  belongs_to :company

  validates :name, presence: true

end
