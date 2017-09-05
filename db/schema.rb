# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170831145642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_areas_on_company_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_banks_on_region_id"
  end

  create_table "benefit_details", force: :cascade do |t|
    t.string "name", null: false
    t.string "value", null: false
    t.bigint "benefit_id"
    t.integer "owner_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_benefit_details_on_benefit_id"
  end

  create_table "benefits", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "region_id"
    t.integer "owner_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_benefits_on_region_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "subdomain", null: false
    t.string "custom_fqdn", null: false
    t.bigint "region_id", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_companies_on_region_id"
    t.index ["subdomain"], name: "index_companies_on_subdomain", unique: true
  end

  create_table "company_benefit_details", force: :cascade do |t|
    t.string "name", null: false
    t.string "value", null: false
    t.bigint "company_benefit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_benefit_id"], name: "index_company_benefit_details_on_company_benefit_id"
  end

  create_table "company_benefits", force: :cascade do |t|
    t.bigint "benefit_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_company_benefits_on_benefit_id"
    t.index ["company_id"], name: "index_company_benefits_on_company_id"
  end

  create_table "company_form_fields", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "form_field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_form_fields_on_company_id"
    t.index ["form_field_id"], name: "index_company_form_fields_on_form_field_id"
  end

  create_table "company_users", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.string "password_digest", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "contract_type_companies", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "contract_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contract_type_companies_on_company_id"
    t.index ["contract_type_id"], name: "index_contract_type_companies_on_contract_type_id"
  end

  create_table "contract_types", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "region_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contract_types_on_company_id"
    t.index ["region_id"], name: "index_contract_types_on_region_id"
  end

  create_table "employee_type_companies", force: :cascade do |t|
    t.bigint "employee_type_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employee_type_companies_on_company_id"
    t.index ["employee_type_id"], name: "index_employee_type_companies_on_employee_type_id"
  end

  create_table "employee_types", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "region_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employee_types_on_company_id"
    t.index ["region_id"], name: "index_employee_types_on_region_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_field_validations", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.string "message", null: false
    t.json "options", default: {}, null: false
    t.bigint "form_field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_field_id"], name: "index_form_field_validations_on_form_field_id"
  end

  create_table "form_fields", force: :cascade do |t|
    t.string "display_name", null: false
    t.string "help_text"
    t.string "name", null: false
    t.string "input_data_source"
    t.string "data_type", null: false
    t.json "widget_attributes", default: {}, null: false
    t.string "widget_type", default: "text", null: false
    t.boolean "required", default: false, null: false
    t.integer "field_order", null: false
    t.json "render_if"
    t.string "depends_on"
    t.bigint "form_section_id", null: false
    t.bigint "region_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_section_id"], name: "index_form_fields_on_form_section_id"
    t.index ["name", "form_section_id"], name: "index_form_fields_on_name_and_form_section_id", unique: true
    t.index ["region_id"], name: "index_form_fields_on_region_id"
  end

  create_table "form_sections", force: :cascade do |t|
    t.string "title"
    t.string "key", null: false
    t.text "description"
    t.integer "section_order", null: false
    t.bigint "form_id", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_sections_on_form_id"
    t.index ["key"], name: "index_form_sections_on_key", unique: true
  end

  create_table "forms", force: :cascade do |t|
    t.string "title", null: false
    t.string "key", null: false
    t.text "description"
    t.string "form_type", null: false
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_forms_on_key", unique: true
  end

  create_table "headquarters", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_headquarters_on_company_id"
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "platform_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_platform_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_platform_users_on_reset_password_token", unique: true
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.string "key", null: false
    t.integer "parent_id"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_regions_on_key", unique: true
    t.index ["name"], name: "index_regions_on_name", unique: true
  end

  create_table "sessions", force: :cascade do |t|
    t.string "access_token", null: false
    t.string "refresh_token", null: false
    t.datetime "expires_at", null: false
    t.bigint "company_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_sessions_on_access_token", unique: true
    t.index ["company_user_id"], name: "index_sessions_on_company_user_id"
    t.index ["refresh_token"], name: "index_sessions_on_refresh_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.string "family_name", null: false
    t.string "additional_family_name"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "work_shift_companies", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "work_shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_work_shift_companies_on_company_id"
    t.index ["work_shift_id"], name: "index_work_shift_companies_on_work_shift_id"
  end

  create_table "work_shifts", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "region_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_work_shifts_on_company_id"
    t.index ["region_id"], name: "index_work_shifts_on_region_id"
  end

  add_foreign_key "areas", "companies"
  add_foreign_key "banks", "regions"
  add_foreign_key "benefit_details", "benefits"
  add_foreign_key "benefits", "regions"
  add_foreign_key "companies", "regions"
  add_foreign_key "company_benefit_details", "company_benefits"
  add_foreign_key "company_benefits", "benefits"
  add_foreign_key "company_benefits", "companies"
  add_foreign_key "company_form_fields", "companies"
  add_foreign_key "company_form_fields", "form_fields"
  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "contract_type_companies", "companies"
  add_foreign_key "contract_type_companies", "contract_types"
  add_foreign_key "contract_types", "companies"
  add_foreign_key "contract_types", "regions"
  add_foreign_key "employee_type_companies", "companies"
  add_foreign_key "employee_type_companies", "employee_types"
  add_foreign_key "employee_types", "companies"
  add_foreign_key "employee_types", "regions"
  add_foreign_key "form_field_validations", "form_fields"
  add_foreign_key "form_fields", "form_sections"
  add_foreign_key "form_fields", "regions"
  add_foreign_key "form_sections", "forms"
  add_foreign_key "headquarters", "companies"
  add_foreign_key "sessions", "company_users"
  add_foreign_key "work_shift_companies", "companies"
  add_foreign_key "work_shift_companies", "work_shifts"
  add_foreign_key "work_shifts", "companies"
  add_foreign_key "work_shifts", "regions"
end
