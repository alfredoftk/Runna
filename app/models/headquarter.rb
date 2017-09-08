class Headquarter < ApplicationRecord

  belongs_to :region
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"
  has_many :company_headquarters
  has_many :companies, through: :company_headquarters
  has_many :headquarter_details

  validates :name, :phone, presence: true

end
