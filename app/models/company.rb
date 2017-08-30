class Company < ApplicationRecord

  belongs_to :region
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "User"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "User"
  has_many :areas
  has_many :company_benefits
  has_many :benefits, through: :company_benefits

  validates :name, :subdomain, :custom_fqdn, presence: true
  validates :subdomain, uniqueness: true

end
