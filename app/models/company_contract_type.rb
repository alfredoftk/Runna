class CompanyContractType < ApplicationRecord

  belongs_to :company
  belongs_to :contract_type

end
