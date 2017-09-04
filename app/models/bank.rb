class Bank < ApplicationRecord

  belongs_to :region
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"
  has_many :company_banks
  has_many :companies, through: :company_banks

  validates :name, presence: true

end
