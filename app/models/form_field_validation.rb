class FormFieldValidation < ApplicationRecord

  belongs_to :form_field

  validates :name, :type, :message, :options, :form_field, presence: true

end
