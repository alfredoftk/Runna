class PlatformUser < ApplicationRecord

  devise :database_authenticatable, :validatable

  validates :description, presence: true

end
