region = Region.find_by(key: 'MEX')
platform_user = PlatformUser.first
# --------------------------------- Add employee step 2

# Form
form_data = { title: "Información Documentos", key: "documents_info", form_type: "employee", description: "", created_by: platform_user, updated_by: platform_user}
form = Form.create(form_data)

document_section_data = {"title":"Documents","key":"document_info","description":"","section_order":1}
document_section = form.form_sections.create(document_section_data)



job_info_fields = [
    {
        display_name: "Documentos",
        help_text: nil,
        name: "suggested_documents_ids",
        input_data_source: nil,
        data_type: "string",
        widget_attributes: {},
        widget_type: "text",
        required: false,
        field_order: 1,
        region: nil,
        form_field_validations_attributes: []
    }
]
document_section.form_fields.create(job_info_fields)

