class CompanyUser < ApplicationRecord

  belongs_to :user
  belongs_to :company
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "CompanyUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "CompanyUser"
  has_many :sessions

  validates :user, presence: true
  validates :company, presence: true

  has_secure_password(validations: false)

  def self.find_or_initialize_by_employee_params_and_company(employee_params, company)
    user = User.find_or_initialize_by(email: employee_params[:personal_email])
    unless user.persisted?
      user.assign_attributes(name: employee_params[:name], family_name: employee_params[:family_name], additional_family_name: employee_params[:additional_family_name])
      return self.new(user: user, company: company)
    end
    return user.company_users.find_or_initialize_by(company: company)
  end

end
