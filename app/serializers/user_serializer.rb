class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :name, :family_name, :additional_family_name

end
