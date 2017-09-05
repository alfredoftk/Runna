region = Region.find_by(key: 'MEX')
platform_user = PlatformUser.first

# --------------------------------- Add employee step 1

# Form
form_data = { title: "Información Básica", key: "basic_info", form_type: "employee", description: "", created_by: platform_user, updated_by: platform_user}
form = Form.create(form_data)

# Form Sections
personal_info_section_data = {"title":"Información Personal","key":"personal_info","description":"","section_order":1}
addittional_basic_info_section_data = {"title":"Información Básica Adicional","key":"addittional_basic_info","description":"","section_order":2}
emergency_contact_section_data = {"title":"Contacto de Emergencia","key":"emergency_contact","description":"","section_order":3}
preferences_section_data = {"title":"Preferencias","key":"preferences","description":"","section_order":4}
account_details_section_data = {"title":"Detalle de cuenta","key":"account_details","description":"","section_order":5}

personal_info_section = form.form_sections.create(personal_info_section_data)
addittional_basic_info_section = form.form_sections.create(addittional_basic_info_section_data)
emergency_contact_section = form.form_sections.create(emergency_contact_section_data)
preferences_section = form.form_sections.create(preferences_section_data)
account_details_section = form.form_sections.create(account_details_section_data)

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
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Nombre requerido",
        type: "FormPresenceValidation",
        message: "El nombre es requerido",
        options: {},
      }
    ]
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
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Apellido Paterno requerido",
        type: "FormPresenceValidation",
        message: "El Apellido Paterno es requerido",
        options: {},
      }
    ]
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
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Apellido Materno requerido",
        type: "FormPresenceValidation",
        message: "El Apellido Materno es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Género",
    help_text: "",
    name: "gender",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {
      options: [
        {
          value: "male",
          label: "Masculino"
        },
        {
          value: "female",
          label: "Femenino"
        }
      ]
    },
    widget_type: "radio",
    required: true,
    field_order: 4,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Género requerido",
        type: "FormPresenceValidation",
        message: "El género es requerido",
        options: {}
      }
    ]
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
    field_order: 5,
    region: nil,
    form_field_validations_attributes: []
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
    field_order: 6,
    region: region,
    form_field_validations_attributes:[
      {
        name: "CURP requerido",
        type: "FormPresenceValidation",
        message: "El CURP es requerido",
        options: {}
      },
      {
        name: "CURP length",
        type: "FormLengthValidation",
        message: "El CURP debe tener 18 caracteres",
        options: {
          is: 18
        }
      },
      {
        name: "CURP Format",
        type: "FormFormatValidation",
        message: "El CURP no tiene el formato correcto",
        options: {
          with: '/\A[A-Z][AEIOUX][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][MH][A-Z][BCDFGHJKLMNÑPQRSTVWXYZ]{4}[0-9A-Z][0-9]\z/i'
        }
      }
    ]
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
    field_order: 7,
    region: region,
    form_field_validations_attributes: [
      {
        name: "RFC requerido",
        type: "FormPresenceValidation",
        message: "El RFC es requerido",
        options: {}
      },
      {
        name: "RFC Format",
        type: "FormFormatValidation",
        message: "El RFC no tiene el formato correcto",
        options: {
          with: '/\A[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9]([A-Z0-9]{3})?\z/i'
        }
      }
    ]
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
    field_order: 8,
    region: region,
    form_field_validations_attributes: [
      {
        name: "Seguro Social requerido",
        type: "FormPresenceValidation",
        message: "El Seguro Social es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Email personal",
    help_text: "",
    name: "personal_email",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "email",
    required: true,
    field_order: 9,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Email Personal requerido",
        type: "FormPresenceValidation",
        message: "El Email Personal es requerido",
        options: {}
      },
      {
        name: "Email Personal Format",
        type: "FormFormatValidation",
        message: "El Email Personal no tiene el formato correcto",
        options: {
          with: '/\A[^@\s]+@[^@\s]+\z/'
        }
      }
    ]
  },
  {
    display_name: "Email laboral",
    help_text: "",
    name: "laboral_email",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "email",
    required: false,
    field_order: 10,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Email laboral Format",
        type: "FormFormatValidation",
        message: "El Email laboral no tiene el formato correcto",
        options: {
          with: '/\A[^@\s]+@[^@\s]+\z/'
        }
      }
    ]
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
    field_order: 11,
    region: nil,
    form_field_validations_attributes: []
  }
]
personal_info_fields = personal_info_section.form_fields.create(personal_info_fields)

# Form fields for addittional_basic_info

addittional_basic_info_fields = [
  {
    display_name: "Nacionalidad",
    help_text: nil,
    name: "nationality",
    input_data_source: "nationality",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 1,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Nacionalidad requerido",
        type: "FormPresenceValidation",
        message: "La Nacionalidad es requerida",
        options: {}
      }
    ]
  },
  {
    display_name: "Teléfono",
    help_text: nil,
    name: "phone",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 2,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Teléfono requerido",
        type: "FormPresenceValidation",
        message: "El Teléfono es requerido",
        options: {}
      }
    ]
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
    widget_type: "select",
    required: true,
    field_order: 3,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Estado Civil requerido",
        type: "FormPresenceValidation",
        message: "El Estado Civil es requerido",
        options: {}
      }
    ]
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
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Dirección requerido",
        type: "FormPresenceValidation",
        message: "La Dirección es requerida",
        options: {}
      }
    ]
  },
  {
    display_name: "¿Tiene Hijos?",
    help_text: "",
    name: "has_children",
    input_data_source: nil,
    data_type: "boolean",
    widget_attributes: {
      options: [
        {
          value: true,
          label: "Sí"
        },
        {
          value: false,
          label: "No"
        }
      ]
    },
    widget_type: "radio",
    required: true,
    field_order: 5,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Tiene Hijos requerido",
        type: "FormPresenceValidation",
        message: "Es requerido",
        options: {}
      }
    ]
  },
  {
    display_name: "Número de Hijos",
    help_text: "",
    name: "children_number",
    input_data_source: nil,
    data_type: "integer",
    widget_attributes: {},
    widget_type: "text",
    required: false,
    field_order: 6,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Email Personal Numericality",
        type: "FormNumericalityValidation",
        message: "El Número de hijos debe ser numérico",
        options: {
          only_integer: true,
          greater_than: 0
        }
      }
    ]
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
    field_order: 7,
    region: nil,
    form_field_validations_attributes: []
  }
]
addittional_basic_info_fields = addittional_basic_info_section.form_fields.create(addittional_basic_info_fields)
children_number_field = FormField.find_by(name: 'children_number')
children_number_field.update(depends_on: 'has_children', render_if: { value: true })

# Form fields for emergency_contact_info

emergency_contact_info_fields = [
  {
    display_name: "Nombre",
    help_text: nil,
    name: "emergency_contact_name",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 1,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Nombre requerido",
        type: "FormPresenceValidation",
        message: "El nombre es requerido",
        options: {},
      }
    ]
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
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Parentezco requerido",
        type: "FormPresenceValidation",
        message: "El parentezco es requerido",
        options: {},
      }
    ]
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
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Email requerido",
        type: "FormPresenceValidation",
        message: "El Email es requerido",
        options: {}
      },
      {
        name: "Email Format",
        type: "FormFormatValidation",
        message: "El Email no tiene el formato correcto",
        options: {
          with: '/\A[^@\s]+@[^@\s]+\z/'
        }
      }
    ]
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
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Celular requerido",
        type: "FormPresenceValidation",
        message: "El Celular es requerido",
        options: {}
      }
    ]
  }
]
emergency_contact_fields = emergency_contact_section.form_fields.create(emergency_contact_info_fields)

# Form fields for preferences_info

preferences_info_fields = [
  {
    display_name: "Alimentación",
    help_text: nil,
    name: "preferences_food",
    input_data_source: "food",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: false,
    field_order: 1,
    region: nil,
    form_field_validations_attributes: []
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
    region: nil,
    form_field_validations_attributes: []
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
    region: nil,
    form_field_validations_attributes: []
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
    region: nil,
    form_field_validations_attributes: []
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
    region: nil,
    form_field_validations_attributes: []
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
    region: nil,
    form_field_validations_attributes: []
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
    region: nil,
    form_field_validations_attributes: []
  }
]
preferences_fields = preferences_section.form_fields.create(preferences_info_fields)

# Form fields for account_details

account_details_fields = [
  {
    display_name: "Método de pago",
    help_text: nil,
    name: "payment_method",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {
      options: [
        {
          value: "wire_transfer",
          label: "Transferencia bancaria"
        },
        {
          value: "check",
          label: "Cheque"
        },
        {
          value: "cash",
          label: "Efectivo"
        }
      ]
    },
    widget_type: "select",
    required: true,
    field_order: 1,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Método de pago requerido",
        type: "FormPresenceValidation",
        message: "El método de pago es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Número de cuenta",
    help_text: nil,
    name: "number_account",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 2,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Número de cuenta requerido",
        type: "FormPresenceValidation",
        message: "El número de cuenta es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Número interbancario",
    help_text: nil,
    name: "interbank_number",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 3,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Número interbancario requerido",
        type: "FormPresenceValidation",
        message: "El número interbancario es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Banco",
    help_text: nil,
    name: "bank",
    input_data_source: "bank",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 4,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Banco requerido",
        type: "FormPresenceValidation",
        message: "El banco es requerido",
        options: {},
      }
    ]
  }
]
account_details_fields = account_details_section.form_fields.create(account_details_fields)
