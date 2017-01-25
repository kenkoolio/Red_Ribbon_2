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

ActiveRecord::Schema.define(version: 20170114000243) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "number"
    t.string   "apt"
    t.string   "street"
    t.string   "city"
    t.integer  "state_id"
    t.integer  "zip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id"
  add_index "addresses", ["zip_id"], name: "index_addresses_on_zip_id"

  create_table "affiliations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "service_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["service_id"], name: "index_contacts_on_service_id"

  create_table "required_docs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "document"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "service_to_addresses", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_to_addresses", ["address_id"], name: "index_service_to_addresses_on_address_id"
  add_index "service_to_addresses", ["service_id"], name: "index_service_to_addresses_on_service_id"

  create_table "service_to_affiliations", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "affiliation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "service_to_affiliations", ["affiliation_id"], name: "index_service_to_affiliations_on_affiliation_id"
  add_index "service_to_affiliations", ["service_id"], name: "index_service_to_affiliations_on_service_id"

  create_table "service_to_docs", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "required_doc_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "service_to_docs", ["required_doc_id"], name: "index_service_to_docs_on_required_doc_id"
  add_index "service_to_docs", ["service_id"], name: "index_service_to_docs_on_service_id"

  create_table "service_to_types", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_to_types", ["service_id"], name: "index_service_to_types_on_service_id"
  add_index "service_to_types", ["type_id"], name: "index_service_to_types_on_type_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.text     "hours"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "alias"
    t.integer  "address_id"
    t.integer  "user_level"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id"

  create_table "zips", force: :cascade do |t|
    t.integer  "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
