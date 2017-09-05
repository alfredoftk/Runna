class ProcessStepSerializer < ActiveModel::Serializer

  attributes :name, :description, :status, :key, :order

end
