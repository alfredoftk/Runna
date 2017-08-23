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

ActiveRecord::Schema.define(version: 20170822194210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "platform_users", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "access_token", null: false
    t.string "refresh_token", null: false
    t.datetime "expires_at", null: false
    t.bigint "tenant_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_sessions_on_access_token", unique: true
    t.index ["refresh_token"], name: "index_sessions_on_refresh_token", unique: true
    t.index ["tenant_user_id"], name: "index_sessions_on_tenant_user_id"
  end

  create_table "tenant_users", force: :cascade do |t|
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
    t.bigint "tenant_id"
    t.bigint "user_id"
    t.bigint "tenant_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_tenant_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tenant_users_on_reset_password_token", unique: true
    t.index ["tenant_id"], name: "index_tenant_users_on_tenant_id"
    t.index ["tenant_user_id"], name: "index_tenant_users_on_tenant_user_id"
    t.index ["user_id"], name: "index_tenant_users_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name", null: false
    t.string "subdomain", null: false
    t.string "custom_fqdn", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tenants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "family_name", null: false
    t.string "additional_family_name", null: false
    t.bigint "platform_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_user_id"], name: "index_users_on_platform_user_id"
  end

  add_foreign_key "sessions", "tenant_users"
  add_foreign_key "tenants", "users"
  add_foreign_key "users", "platform_users"
end
