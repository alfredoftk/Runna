class FormFieldValidationSerializer < ActiveModel::Serializer

  attributes :name, :type, :options, :message

end
