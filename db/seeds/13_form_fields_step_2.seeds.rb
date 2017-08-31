region = Region.find_by(key: 'MEX')
platform_user = PlatformUser.first

# --------------------------------- Add employee step 2

# Form
form_data = { title: "Información de Empleo", key: "employment_info", form_type: "employee", description: "", created_by: platform_user, updated_by: platform_user}
form = Form.create(form_data)

# Form Sections
job_info_section_data = {"title":"Información del puesto","key":"job_info","description":"","section_order":1}
contract_info_section_data = {"title":"Información de contrato","key":"contract_info","description":"","section_order":2}
compensation_info_section_data = {"title":"Compensación","key":"compensation","description":"","section_order":3}

job_info_section = form.form_sections.create(job_info_section_data)
contract_info_section = form.form_sections.create(contract_info_section_data)
compensation_info_section = form.form_sections.create(compensation_info_section_data)

# Form fields for personal_info

job_info_fields = [
  {
    display_name: "Puesto",
    help_text: nil,
    name: "job",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 1,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Puesto requerido",
        type: "FormPresenceValidation",
        message: "El puesto es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Área",
    help_text: nil,
    name: "area",
    input_data_source: "area",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 2,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Área requerida",
        type: "FormPresenceValidation",
        message: "El área es requerida",
        options: {},
      }
    ]
  },
  {
    display_name: "Reportar a",
    help_text: nil,
    name: "report_to",
    input_data_source: "user",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 3,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Reportar a requerido",
        type: "FormPresenceValidation",
        message: "El campo Reportar a es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Sede",
    help_text: nil,
    name: "headquarter",
    input_data_source: "headquarter",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 4,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Sede requerida",
        type: "FormPresenceValidation",
        message: "Sede es requerida",
        options: {},
      }
    ]
  },
  {
    display_name: "Sindicalizado",
    help_text: "",
    name: "has_union",
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
        name: "Sindicalizado requerido",
        type: "FormPresenceValidation",
        message: "Es requerido",
        options: {}
      }
    ]
  },
  {
    display_name: "Prestaciones",
    help_text: "",
    name: "benefits",
    input_data_source: "benefit",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 6,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Prestaciones requerido",
        type: "FormPresenceValidation",
        message: "Es requerido",
        options: {}
      }
    ]
  }
]
job_info_section.form_fields.create(job_info_fields)

contract_info_fields = [
  {
    display_name: "Fecha de Inicio de Contrato",
    help_text: nil,
    name: "contract_start_date",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 1,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Fecha de inicio de Contrato requerida",
        type: "FormPresenceValidation",
        message: "La fecha de inicio de contrato es requerida",
        options: {},
      }
    ]
  },
  {
    display_name: "Fecha de Fin de Contrato",
    help_text: nil,
    name: "contract_end_date",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 2,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Fecha de Fin de Contrato requerida",
        type: "FormPresenceValidation",
        message: "La fecha de fin de contrato es requerida",
        options: {},
      }
    ]
  },
  {
    display_name: "Tipo de Contrato",
    help_text: nil,
    name: "contract_type",
    input_data_source: "ContractType",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 3,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Tipo de Contrato requerido",
        type: "FormPresenceValidation",
        message: "El tipo de contrato es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Tipo de Empleado",
    help_text: nil,
    name: "employee_type",
    input_data_source: "EmployeeType",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 4,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Tipo de Empleado requerido",
        type: "FormPresenceValidation",
        message: "El tipo de empleado es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Turno de Trabajo",
    help_text: nil,
    name: "work_shift",
    input_data_source: "WorkShift",
    data_type: "string",
    widget_attributes: {},
    widget_type: "select",
    required: true,
    field_order: 5,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Turno de Trabajo requerido",
        type: "FormPresenceValidation",
        message: "El turno de trabajo es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Adjuntar Contrato",
    help_text: "",
    name: "attach_contract",
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
    required: false,
    field_order: 6,
    region: nil,
    form_field_validations_attributes: []
  }
]
contract_info_section.form_fields.create(contract_info_fields)

compensation_info_fields = [
  {
    display_name: "Tipo de Compensación",
    help_text: "",
    name: "compensation_type",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {
      options: [
        {
          value: "fixed",
          label: "Fijo"
        },
        {
          value: "mixed",
          label: "Mixto"
        },
        {
          value: "varied",
          label: "Variado"
        }
      ]
    },
    widget_type: "select",
    required: true,
    field_order: 1,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Tipo de Compensación requerido",
        type: "FormPresenceValidation",
        message: "El tipo de compensación es requerido",
        options: {}
      }
    ]
  },
  {
    display_name: "Sueldo Bruto Mensual",
    help_text: nil,
    name: "monthly_amount",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {},
    widget_type: "text",
    required: true,
    field_order: 2,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Sueldo Bruto Mensual requerido",
        type: "FormPresenceValidation",
        message: "El sueldo bruto mensual es requerido",
        options: {},
      }
    ]
  },
  {
    display_name: "Grupo de Nómina",
    help_text: "",
    name: "payroll_group",
    input_data_source: nil,
    data_type: "string",
    widget_attributes: {
      options: [
        {
          value: "weekly",
          label: "Semanal"
        },
        {
          value: "fortnightly",
          label: "Catorcenal"
        },
        {
          value: "semi_monthly",
          label: "Quincenal"
        },
        {
          value: "monthly",
          label: "Mensual"
        }
      ]
    },
    widget_type: "select",
    required: true,
    field_order: 3,
    region: nil,
    form_field_validations_attributes: [
      {
        name: "Grupo de Nómina requerido",
        type: "FormPresenceValidation",
        message: "El grupo de nómina es requerido",
        options: {}
      }
    ]
  }
]
compensation_info_section.form_fields.create(compensation_info_fields)
