module Auth

  class UserAuthenticatorService

    attr_accessor :user, :session, :error_response

    def initialize(email, password)
      @email = email
      @password = password
    end

    def authenticate
      if user_exists?
        @session = @user.sessions.create
      end
      return @session.present?
    end

    private

    attr_reader :email, :password

    def user_exists?
      if user = User.find_by_email(email)
        if user.valid_password?(password)
          @user = user
        else
          @error_response = ErrorResponse.new(status_code: :unprocessable_entity, title: "No se inició sesión", reasons: { password: "is incorrect" }, description: "Verifique su usuario y/o contraseña")
        end
      else
        @error_response = ErrorResponse.new(status_code: :unprocessable_entity, title: "No se inició sesión", reasons: { email: "does not exist" }, description: "Verifique su usuario y/o contraseña")
      end
      return @user.present?
    end

  end

end
