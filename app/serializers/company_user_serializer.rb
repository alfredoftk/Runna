class CompanyUserSerializer < ActiveModel::Serializer

  belongs_to :user
  belongs_to :company

end
