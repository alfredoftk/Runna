class CompanyUser < ApplicationRecord

  belongs_to :user
  belongs_to :company
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "CompanyUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "CompanyUser"
  has_many :sessions

  validates :user, presence: true
  validates :company, presence: true

  has_secure_password

end
