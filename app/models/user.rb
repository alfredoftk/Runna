class User < ApplicationRecord

  belongs_to :created_by, foreign_key: :created_by_id, class_name: "PlatformUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "PlatformUser"

  validates :name, :email, :family_name, :additional_family_name, presence: true

end
