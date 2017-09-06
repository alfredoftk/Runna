class CompanyDocument < ApplicationRecord

  belongs_to :company
  belongs_to :document
  belongs_to :employee

end
