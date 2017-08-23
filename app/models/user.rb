class User < ApplicationRecord

  belongs_to :platform_user

  validates :name, :family_name, :additional_family_name, presence: true

end
