class CompanyBank < ApplicationRecord

  belongs_to :company
  belongs_to :bank

end
