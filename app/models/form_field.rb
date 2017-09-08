class FormField < ApplicationRecord

  belongs_to :region
  belongs_to :form_section
  belongs_to :created_by, foreign_key: :created_by_id, class_name: "PlatformUser"
  belongs_to :updated_by, foreign_key: :updated_by_id, class_name: "PlatformUser"
  has_many :form_field_validations
  has_many :company_form_fields
  has_many :companies, through: :company_form_fields

  validates :display_name, :name, :data_type, :widget_attributes, :widget_type, :required, :field_order, :form_section, presence: true

  accepts_nested_attributes_for :form_field_validations

  def self.form_fields_by_form_id form_id
    self.joins(form_section: :form).where('forms.id = ?', form_id).includes(:form_section, :form_field_validations)
  end

  def self.form_fields_for_company company
    self.where('form_fields.region_id IS NULL OR form_fields.region_id = ?', company.region_id)
  end

end
