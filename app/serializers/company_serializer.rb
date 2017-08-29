class CompanySerializer < ActiveModel::Serializer

  attributes :id, :name, :subdomain, :custom_fqdn

end
