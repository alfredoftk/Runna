class Tenant < ApplicationRecord

  belongs_to :created_by, foreign_key: :created_by_id, class_name: "User"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "User"

  validates :name, :subdomain, :custom_fqdn, presence: true
  validates :subdomain, uniqueness: true

end
