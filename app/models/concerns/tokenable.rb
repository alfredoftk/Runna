module Tokenable
  
  extend ActiveSupport::Concern

  def generate_token
    loop do
      random_token = SecureRandom.urlsafe_base64(48, false)
      break random_token unless self.class.exists?(access_token: random_token)
    end
  end

end
