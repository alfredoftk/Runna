module APIAuthenticable

  # Devise methods overwrites

  def current_session
    @current_session ||= Session.find_by(access_token: request.headers['Authorization'])
  end

  def find_user_by_session
    @current_user ||= (current_session ? (current_session.expired? ? nil : current_session.user) : nil)
  end

  def current_user
    @current_user ? @current_user : find_user_by_session
  end

  def user_signed_in?
    current_user.present?
  end

  # Use:
  # - before_action :authenticate_with_token!, only: [:update, :destroy]
  def authenticate_with_token!
    response_error_json_format(ErrorResponse.unauthorized) unless user_signed_in?
  end

end
