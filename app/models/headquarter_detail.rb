class HeadquarterDetail < ApplicationRecord

  belongs_to :headquarter
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"

  validates :name, :value, presence: true

end
