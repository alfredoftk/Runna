class Tenant < ApplicationRecord

  belongs_to :user

  validates :name, :subdomain, :custom_fqdn, presence: true

end
