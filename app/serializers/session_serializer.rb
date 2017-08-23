class SessionSerializer < ActiveModel::Serializer

  attributes :access_token, :refresh_token, :expires_at

end
