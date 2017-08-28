platform_user = PlatformUser.first

# Form
form_data = { title: "Información Básica", key: "basic_info", form_type: "employee", description: "", created_by: platform_user, updated_by: platform_user}
form = Form.create(form_data)

# Form Sections
personal_info_section_data = {"title":"Información Personal","key":"personal_info","description":"","section_order":1}
addittional_basic_info_section_data = {"title":"Información Básica Adicional","key":"addittional_basic_info","description":"","section_order":2}
emergency_contact_section_data = {"title":"Contacto de Emergencia","key":"emergency_contact","description":"","section_order":3}
preferences_section_data = {"title":"Preferencias","key":"preferences","description":"","section_order":4}

personal_info_section = form.form_sections.create(personal_info_section_data)
addittional_basic_info_section = form.form_sections.create(addittional_basic_info_section_data)
emergency_contact_section = form.form_sections.create(emergency_contact_section_data)
preferences_section = form.form_sections.create(preferences_section_data)

# Form fields for personal_info

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
    widget_type: "text",
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
    display_name: "ID de empleado",
    help_text: "",
    name: "employee_identifier",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: false,
    field_order: 4,
    region_id: nil
  },
  {
    display_name: "CURP",
    help_text: "",
    name: "curp",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 5,
    region_id: nil
  },
  {
    display_name: "RFC",
    help_text: "Registro Federal de Contribuyentes requerido para realizar actividades económicas lícitas por la que se esté obligada a pagar impuestos.",
    name: "rfc",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 6,
    region_id: nil
  },
  {
    display_name: "Seguro Social",
    help_text: "",
    name: "social_insurance",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 7,
    region_id: nil
  },
  {
    display_name: "Email Personal",
    help_text: "",
    name: "personal_email",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 8,
    region_id: nil
  },
  {
    display_name: "Email laboral",
    help_text: "",
    name: "laboral_email",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: false,
    field_order: 9,
    region_id: nil
  },
  {
    display_name: "Invitar al empleado a ingresar la información personal adicional",
    help_text: "",
    name: "invite_employee_to_fill_addittional_info",
    input_data_source: nil,
    data_type: "boolean",
    widget_attributes: {
      options: [
        {
          value: true,
          label: "Invitar al empleado a ingresar la información personal adicional"
        }
      ]
    },
    widget_type: "checkbox",
    required: false,
    field_order: 9,
    region_id: nil
  }
]
personal_info_section.form_fields.create(personal_info_fields)

# Form fields for addittional_basic_info

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
    name: "civil_status",
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
    display_name: "Dirección",
    help_text: "",
    name: "address",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 4,
    region_id: nil
  },
  {
    display_name: "Hijos",
    help_text: "",
    name: "children",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 5,
    region_id: nil
  },
  {
    display_name: "Perfil de Linkedin",
    help_text: "",
    name: "linkedin_profile",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: false,
    field_order: 6,
    region_id: nil
  }
]
addittional_basic_info_section.form_fields.create(addittional_basic_info_fields)

# Form fields for emergency_contact_info

emergency_contact_info_fields = [
  {
    display_name: "Nombre",
    help_text: nil,
    name: "emergency_contact_name",
    input_data_source: "",
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 1,
    region_id: nil
  },
  {
    display_name: "Parentezco",
    help_text: nil,
    name: "emergency_contact_relationship",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 2,
    region_id: nil
  },
  {
    display_name: "Email",
    help_text: nil,
    name: "emergency_contact_email",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 3,
    region_id: nil
  },
  {
    display_name: "Celular",
    help_text: nil,
    name: "emergency_contact_phone",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 4,
    region_id: nil
  }
]
emergency_contact_section.form_fields.create(emergency_contact_info_fields)

# Form fields for preferences_info

preferences_info_fields = [
  {
    display_name: "Alimentación",
    help_text: nil,
    name: "preferences_food",
    input_data_source: "food",
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: false,
    field_order: 1,
    region_id: nil
  },
  {
    display_name: "Alergias",
    help_text: nil,
    name: "preferences_allergies",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: false,
    field_order: 2,
    region_id: nil
  },
  {
    display_name: "Color Favorito",
    help_text: nil,
    name: "preferences_favorite_color",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: false,
    field_order: 3,
    region_id: nil
  },
  {
    display_name: "Dulce Favorito",
    help_text: nil,
    name: "preferences_favorite_sweet",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: false,
    field_order: 4,
    region_id: nil
  },
  {
    display_name: "Bebida Favorita",
    help_text: nil,
    name: "preferences_favorite_drink",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: false,
    field_order: 5,
    region_id: nil
  },
  {
    display_name: "Café o Té",
    help_text: "",
    name: "preferences_coffee_or_tea",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {
      options: [
        {
          value: "coffee",
          label: "Café"
        },
        {
          value: "tea",
          label: "Té"
        }
      ]
    },
    widget_type: "select",
    required: false,
    field_order: 6,
    region_id: nil
  },
  {
    display_name: "Dulce o Salado",
    help_text: "",
    name: "preferences_sweet_or_salt",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {
      options: [
        {
          value: "sweet",
          label: "Dulce"
        },
        {
          value: "salt",
          label: "Salado"
        }
      ]
    },
    widget_type: "select",
    required: false,
    field_order: 7,
    region_id: nil
  }
]
preferences_section.form_fields.create(preferences_info_fields)
