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

ActiveRecord::Schema.define(version: 20161112113246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "retailer"
    t.string   "supplier"
    t.string   "logo"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "email_domain"
  end

  create_table "extractions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "search_id"
    t.integer  "template_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["search_id"], name: "index_extractions_on_search_id", using: :btree
    t.index ["template_id"], name: "index_extractions_on_template_id", using: :btree
    t.index ["user_id"], name: "index_extractions_on_user_id", using: :btree
  end

  create_table "searches", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id", using: :btree
  end

  create_table "templates", force: :cascade do |t|
    t.string   "name"
    t.string   "format"
    t.text     "headers",     default: [],              array: true
    t.text     "item_fields", default: [],              array: true
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_templates_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_picture"
    t.boolean  "admin",                  default: false
    t.boolean  "access_validated",       default: false, null: false
    t.integer  "access_level",           default: 1,     null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_users_on_company_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "extractions", "searches"
  add_foreign_key "extractions", "templates"
  add_foreign_key "extractions", "users"
  add_foreign_key "searches", "users"
  add_foreign_key "templates", "users"
  add_foreign_key "users", "companies"
end
