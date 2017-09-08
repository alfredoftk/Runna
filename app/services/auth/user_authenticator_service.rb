module Auth

  class UserAuthenticatorService

    attr_accessor :company_user, :session, :error_response

    def initialize(email, password, subdomain)
      @email = email
      @password = password
      @subdomain = subdomain
    end

    def authenticate
      if company_user_exists?
        @session = @company_user.sessions.create
      end
      return @session.present?
    end

    private

    attr_reader :email, :password, :subdomain

    def company_user_exists?
      if company_user = CompanyUser.find_by(company: company, user: user)
        if company_user.authenticate(password)
          @company_user = company_user
        else
          @error_response = ErrorResponse.new(error: ErrorCode::DataValidation::VALIDATION_ERROR, title: "No se inició sesión", reasons: { password: "is incorrect" }, description: "Verifique su usuario y/o contraseña")
        end
      else
        @error_response = ErrorResponse.new(error: ErrorCode::DataValidation::VALIDATION_ERROR, title: "No se inició sesión", reasons: { company_user: "not found" }, description: "Verifique el subdomain y/o email")
      end
      return @company_user.present?
    end

    def company
      @company = Company.find_by_subdomain(subdomain)
      if @company.nil?
        @error_response = ErrorResponse.new(error: ErrorCode::DataValidation::VALIDATION_ERROR, title: "No se inició sesión", reasons: { subdomain: "does not exist" }, description: "Verifique su subdomain")
      end
      return @company
    end

    def user
      @user = User.find_by_email(email)
      if @user.nil?
        @error_response = ErrorResponse.new(error: ErrorCode::DataValidation::VALIDATION_ERROR, title: "No se inició sesión", reasons: { email: "does not exist" }, description: "Verifique su cuenta")
      end
      return @user
    end

  end

end
