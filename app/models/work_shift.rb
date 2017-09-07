class WorkShift < ApplicationRecord

  belongs_to :region
  belongs_to :company_owner, foreign_key: :company_owner_id, class_name: "Company"
  has_many :company_work_shifts
  has_many :companies, through: :company_work_shifts
  has_many :work_shift_details

  validates :name, presence: true

end
