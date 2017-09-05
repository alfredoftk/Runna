class Nationality < ApplicationRecord

  self.table_name = 'countries'

  def self.default_scope
  	select(:id, :nationality)
  end

end
