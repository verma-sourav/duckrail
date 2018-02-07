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

ActiveRecord::Schema.define(version: 20171111190119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_state", force: :cascade do |t|
    t.integer  "singleton_guard",            default: 0
    t.string   "mock_synchronization_token"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "application_state", ["singleton_guard"], name: "index_application_state_on_singleton_guard", unique: true, using: :btree

  create_table "headers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "value",      null: false
    t.integer  "mock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "headers", ["mock_id"], name: "index_headers_on_mock_id", using: :btree

  create_table "mocks", force: :cascade do |t|
    t.string   "name",                          null: false
    t.text     "description"
    t.integer  "status",                        null: false
    t.string   "content_type",                  null: false
    t.string   "request_method",                null: false
    t.string   "route_path",                    null: false
    t.string   "body_type"
    t.text     "body_content"
    t.string   "script_type"
    t.text     "script"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "active",         default: true, null: false
    t.integer  "mock_order",                    null: false
  end

  add_index "mocks", ["name"], name: "index_mocks_on_name", unique: true, using: :btree

  add_foreign_key "headers", "mocks", on_delete: :cascade
end
