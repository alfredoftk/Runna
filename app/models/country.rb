class Country < ApplicationRecord

  validates :name, :nationality, presence: true

end
