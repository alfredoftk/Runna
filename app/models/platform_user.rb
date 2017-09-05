class PlatformUser < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :description, presence: true

end
