class SuggestedEmployeeDocument < ApplicationRecord
  belongs_to :employee
  belongs_to :document
end
