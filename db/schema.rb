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

ActiveRecord::Schema.define(version: 20161213184013) do

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
