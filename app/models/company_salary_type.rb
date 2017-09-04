class CompanySalaryType < ApplicationRecord

  belongs_to :company
  belongs_to :salary_type

end
