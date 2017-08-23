class TenantUser < ApplicationRecord

  belongs_to :user
  belongs_to :tenant
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "TenantUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "TenantUser"
  has_many :sessions

  has_secure_password

  validates :password, presence: true

end
