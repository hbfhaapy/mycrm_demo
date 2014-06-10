# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140610000106) do

  create_table "cm_collections", force: true do |t|
    t.string   "name"
    t.datetime "percent"
    t.datetime "time"
    t.integer  "contact_id"
    t.integer  "user_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cm_collections", ["user_id_id"], name: "index_cm_collections_on_user_id_id", using: :btree

  create_table "cm_contracts", force: true do |t|
    t.string   "name"
    t.float    "amount"
    t.float    "actual_amount"
    t.integer  "status_id"
    t.integer  "agent_id"
    t.datetime "signed_at"
    t.datetime "started_at"
    t.integer  "company_id"
    t.integer  "plan_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cm_contracts", ["user_id"], name: "index_cm_contracts_on_user_id", using: :btree

  create_table "crm_activities", force: true do |t|
    t.string   "name"
    t.integer  "status_id"
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "note"
    t.integer  "activityable_id"
    t.integer  "activityable_type"
    t.datetime "time"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crm_activities", ["user_id"], name: "index_crm_activities_on_user_id", using: :btree

  create_table "crm_addresses", force: true do |t|
    t.string   "content"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_companies", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "zipcode"
    t.string   "mail"
    t.text     "note"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contacts_count", default: 0
    t.integer  "deals_count",    default: 0
  end

  add_index "crm_companies", ["user_id"], name: "index_crm_companies_on_user_id", using: :btree

  create_table "crm_contacts", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "mail"
    t.string   "qq"
    t.string   "msn"
    t.string   "job"
    t.text     "note"
    t.string   "image"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activities_count", default: 0
    t.integer  "deals_count",      default: 0
  end

  add_index "crm_contacts", ["user_id"], name: "index_crm_contacts_on_user_id", using: :btree

  create_table "crm_deal_pricelists", force: true do |t|
    t.text     "content"
    t.boolean  "dealed"
    t.integer  "deal_id"
    t.integer  "user_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crm_deals", force: true do |t|
    t.string   "name"
    t.integer  "status_id"
    t.integer  "category_id"
    t.float    "amount"
    t.integer  "company_id"
    t.integer  "contact_id"
    t.integer  "user_id"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activities_count", default: 0
  end

  create_table "crm_phones", force: true do |t|
    t.integer  "klass_id"
    t.string   "number"
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fm_billings", force: true do |t|
    t.float    "amount"
    t.datetime "time"
    t.integer  "manager_id"
    t.integer  "company_id"
    t.integer  "collection_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fm_billings", ["user_id"], name: "index_fm_billings_on_user_id", using: :btree

  create_table "fm_incomes", force: true do |t|
    t.float    "amount"
    t.datetime "time"
    t.string   "note"
    t.integer  "collection_id"
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fm_incomes", ["user_id"], name: "index_fm_incomes_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "smartfinders", force: true do |t|
    t.string   "url"
    t.string   "klass"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "smartfinders", ["user_id"], name: "index_smartfinders_on_user_id", using: :btree

  create_table "table_roles_users", force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "table_roles_users", ["role_id"], name: "index_table_roles_users_on_role_id", using: :btree
  add_index "table_roles_users", ["user_id"], name: "index_table_roles_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "avatar"
    t.boolean  "approved"
    t.integer  "organization_id"
    t.integer  "level"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
