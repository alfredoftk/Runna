class User < ApplicationRecord

  belongs_to :created_by, foreign_key: :created_by_id, class_name: "User"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "User"
  has_many :company_users
  has_many :companies, :through => :company_users

  validates :name, :email, :family_name, presence: true
  validates :email, uniqueness: true

end
