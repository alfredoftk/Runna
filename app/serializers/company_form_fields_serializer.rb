class CompanyFormFieldsSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :form, :meta

  def form
    form_attributes = serialized_form(object[:form]).to_h
    form_attributes[:sections] = (
      object[:company_form_fields].group_by(&:form_section).map do |form_section, form_fields|
        form_section_attributes = serialized_form_section(form_section).to_h
        form_section_attributes[:fields] = serialized_form_fields(form_fields)
        form_section_attributes
      end
    )
    return form_attributes
  end

  def meta
    meta_attributes = Hash.new
    meta_attributes[:form] = meta_form
    meta_attributes[:fields] = meta_fields
    return meta_attributes
  end

  def meta_form
    {
      actions: {
        continue_later: { url: continue_later_processes_path, method: 'POST' },
        submit: { url: processes_path, method: 'POST' }
      }
    }
  end

  def meta_fields
    (
      object[:company_form_fields].select{|form_field| !form_field.depends_on.blank? }.map do |form_field|
        meta_field(form_field)
      end
    ).to_h
  end

  def meta_field form_field
    ["#{form_field.id}", { depends_on: form_field.depends_on, render_if: form_field.render_if }]
  end

  private

  def serialized_form form
    FormSerializer.new(form, scope: scope, root: false)
  end

  def serialized_form_section form_section
    FormSectionSerializer.new(form_section, scope: scope, root: false)
  end

  def serialized_form_fields form_fields
    form_fields.map{ |form_field| FormFieldSerializer.new(form_field, scope: scope, root: false) }
  end

end
