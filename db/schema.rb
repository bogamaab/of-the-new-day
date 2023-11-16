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

ActiveRecord::Schema[7.1].define(version: 2023_11_16_195611) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "account_number"
    t.string "contact_number"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_clients_on_city_id"
  end

  create_table "consultants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_consultants_on_user_id", unique: true
  end

  create_table "document_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string "serial"
    t.bigint "type_equipment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_equipment_id"], name: "index_equipment_on_type_equipment_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "amount"
    t.bigint "type_material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_material_id"], name: "index_materials_on_type_material_id"
  end

  create_table "technicians", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_technicians_on_user_id", unique: true
  end

  create_table "type_equipments", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_materials", force: :cascade do |t|
    t.string "code"
    t.string "unit"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_work_orders", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "identification_number"
    t.string "contact_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id", null: false
    t.bigint "document_type_id", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["document_type_id"], name: "index_users_on_document_type_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["identification_number"], name: "index_users_on_identification_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_orders", force: :cascade do |t|
    t.string "node"
    t.string "failure_note"
    t.string "marker", limit: 9
    t.string "closing_note"
    t.bigint "type_work_order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_work_order_id"], name: "index_work_orders_on_type_work_order_id"
  end

  add_foreign_key "admins", "users"
  add_foreign_key "clients", "cities"
  add_foreign_key "consultants", "users"
  add_foreign_key "equipment", "type_equipments"
  add_foreign_key "materials", "type_materials"
  add_foreign_key "technicians", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "document_types"
  add_foreign_key "work_orders", "type_work_orders"
end
