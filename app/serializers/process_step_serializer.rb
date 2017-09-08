class ProcessStepSerializer < ActiveModel::Serializer

  attributes :name, :description, :status, :key, :step_order

end
