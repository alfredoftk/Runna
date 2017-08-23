class TenantUser < ApplicationRecord

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user
  belongs_to :tenant

  has_many :sessions

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/

  def self.valid_email_format? email
    return EMAIL_REGEX.match(email)
  end

  def create_session
    session = self.sessions.build
    session.save
    session
  end

end
