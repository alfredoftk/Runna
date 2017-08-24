module Auth

  class UserAuthenticatorService

    attr_accessor :tenant_user, :session, :error_response

    def initialize(email, password, subdomain)
      @email = email
      @password = password
      @subdomain = subdomain
    end

    def authenticate
      if tenant_user_exists?
        @session = @tenant_user.sessions.create
      end
      return @session.present?
    end

    private

    attr_reader :email, :password, :subdomain

    def tenant_user_exists?
      if tenant_user = TenantUser.find_by(tenant: tenant, user: user)
        if tenant_user.authenticate(password)
          @tenant_user = tenant_user
        else
          @error_response = ErrorResponse.new(status_code: :unprocessable_entity, title: "No se inició sesión", reasons: { password: "is incorrect" }, description: "Verifique su usuario y/o contraseña")
        end
      else
        @error_response = ErrorResponse.new(status_code: :unprocessable_entity, title: "No se inició sesión", reasons: { tenant_user: "not found" }, description: "Verifique el subdomain y/o email")
      end
      return @tenant_user.present?
    end

    def tenant
      @tenant = Tenant.find_by_subdomain(subdomain)
      if @tenant.nil?
        @error_response = ErrorResponse.new(status_code: :unprocessable_entity, title: "No se inició sesión", reasons: { subdomain: "does not exist" }, description: "Verifique su subdomain")
      end
      return @tenant
    end

    def user
      @user = User.find_by_email(email)
      if @user.nil?
        @error_response = ErrorResponse.new(status_code: :unprocessable_entity, title: "No se inició sesión", reasons: { email: "does not exist" }, description: "Verifique su cuenta")
      end
      return @user
    end

  end

end
