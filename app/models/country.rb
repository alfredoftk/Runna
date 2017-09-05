class Country < ApplicationRecord

  def self.default_scope
    select(:id, :name)
  end

end
