platform_user = PlatformUser.first

// Form
form_data = { title: "Información Básica", key: "basic_info", description: "", created_by: platform_user, updated_by: platform_user}
form = Form.create(form_data)

// Form Sections
personal_info_section_data = {"title":"Información Personal","key":"personal_info","description":"","section_order":1}
addittional_basic_info_section_data = {"title":"Información Básica Adicional","key":"addittional_basic_info","description":"","section_order":2}
emergency_contact_section_data = {"title":"Contacto de Emergencia","key":"emergency_contact","description":"","section_order":3}
preferences_section_data = {"title":"Preferencias","key":"preferences","description":"","section_order":4}

personal_info_section = form.form_sections.create(personal_info_section_data)
addittional_basic_info_section = form.form_sections.create(addittional_basic_info_section_data)
emergency_contact_section = form.form_sections.create(emergency_contact_section_data)
preferences_section = form.form_sections.create(preferences_section_data)

// Form fields for personal_info

personal_info_fields = [
  {
    display_name: "Nombre",
    help_text: nil,
    name: "name",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 1,
    region_id: nil
  },
  {
    display_name: "Apellido Paterno",
    help_text: nil,
    name: "family_name",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "",
    required: true,
    field_order: 2,
    region_id: nil
  },
  {
    display_name: "Apellido Materno",
    help_text: nil,
    name: "additional_family_name",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 3,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "",
    widget_attributes: {},
    widget_type: "",
    required: "",
    field_order: 4,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "",
    widget_attributes: {},
    widget_type: "",
    required: "",
    field_order: 5,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "",
    widget_attributes: {},
    widget_type: "",
    required: "",
    field_order: 6,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "",
    widget_attributes: {},
    widget_type: "",
    required: "",
    field_order: 7,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "",
    widget_attributes: {},
    widget_type: "",
    required: "",
    field_order: 8,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "",
    widget_attributes: {},
    widget_type: "",
    required: "",
    field_order: 9,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "invite_employee_to_fill_addittional_info",
    input_data_source: nil,
    data_type: "boolean",
    widget_attributes: {},
    widget_type: "checkbox",
    required: false,
    field_order: 9,
    region_id: nil
  }
]
personal_info_section.form_fields.create(personal_info_fields)

// Form fields for addittional_basic_info

addittional_basic_info_fields = [
  {
    display_name: "Nacionalidad",
    help_text: nil,
    name: "name",
    input_data_source: "nacionality",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 1,
    region_id: nil
  },
  {
    display_name: "Teléfono",
    help_text: nil,
    name: "family_name",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 2,
    region_id: nil
  },
  {
    display_name: "Estado Civil",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {
      options: [
        {
          value: "single",
          label: "Soltero(a)"
        },
        {
          value: "married",
          label: "Casado(a)"
        },
        {
          value: "widower",
          label: "Viudo(a)"
        },
        {
          value: "divorced",
          label: "Divorciado(a)"
        }
      ]
    },
    widget_type: "",
    required: true,
    field_order: 3,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "",
    widget_attributes: {},
    widget_type: "",
    required: "",
    field_order: 4,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "",
    widget_attributes: {},
    widget_type: "",
    required: "",
    field_order: 5,
    region_id: nil
  },
  {
    display_name: "",
    help_text: "",
    name: "",
    input_data_source: nil,
    data_type: "",
    widget_attributes: {},
    widget_type: "",
    required: "",
    field_order: 6,
    region_id: nil
  }
]
addittional_basic_info_section.form_fields.create(addittional_basic_info_fields)

// Form fields for emergency_contact

emergency_contact_section

// Form fields for preferences

preferences_section
