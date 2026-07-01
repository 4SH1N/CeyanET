# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_07_01_141015) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.bigint "ticket_id", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_activities_on_ticket_id"
  end

  create_table "clients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.date "join_date", null: false
    t.string "location"
    t.string "name", default: "", null: false
    t.text "note"
    t.string "phone"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "responsible", default: "", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "devices", force: :cascade do |t|
    t.string "brand"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.string "device_type"
    t.datetime "last_maintenance"
    t.string "location"
    t.string "name"
    t.text "note"
    t.string "os"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_devices_on_client_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.bigint "device_id"
    t.integer "priority"
    t.integer "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_tickets_on_client_id"
    t.index ["device_id"], name: "index_tickets_on_device_id"
  end

  add_foreign_key "activities", "tickets"
  add_foreign_key "devices", "clients"
  add_foreign_key "tickets", "clients"
  add_foreign_key "tickets", "devices"
end
