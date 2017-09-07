class ContractType < ApplicationRecord

  belongs_to :region
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"
  has_many :company_contract_types
  has_many :companies, through: :company_contract_types
  has_many :contract_type_details

  validates :name, presence: true

end
