class Document < ApplicationRecord

  belongs_to :region
  belongs_to :entity, polymorphic: true
  has_many :company_documents
  has_many :companies, through: :company_documents

  validates :name, presence: true

end
