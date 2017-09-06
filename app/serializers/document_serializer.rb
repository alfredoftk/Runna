class DocumentSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :allow_update, :type

end
