module Auth

  class RefreshTokenService

    attr_accessor :session, :error_response

    def initialize(old_session,refresh_token)
      @old_session = old_session
      @refresh_token = refresh_token
    end

    def refresh
      if @old_session and @old_session.refresh_token == @refresh_token
        @old_session.expire!
        @session = @old_session.company_user.sessions.create
      else
        @error_response = ErrorResponse.new(status_code: :unauthorized, title: 'Could not refresh token', reasons: { base: "Access token or refresh token is invalid" }, description: "Enter a valid access and refresh token")
      end
      return @session.present?
    end

  end

end
