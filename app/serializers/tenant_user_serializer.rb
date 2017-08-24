class TenantUserSerializer < ActiveModel::Serializer

  belongs_to :user
  belongs_to :tenant

end
