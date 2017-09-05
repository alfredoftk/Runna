class Nationality < ApplicationRecord

  self.table_name = 'countries'

  def name
    nationality
  end

end
