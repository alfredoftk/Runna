class Area < ApplicationRecord

  belongs_to :region
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"
  has_many :company_areas
  has_many :companies, through: :company_areas
  has_many :area_details

  validates :name, presence: true

end
