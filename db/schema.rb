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

ActiveRecord::Schema.define(version: 2021_10_11_213038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "cep"
    t.string "road"
    t.string "number"
    t.string "district"
    t.string "reference_point"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "cnpj"
    t.string "name"
    t.string "phone"
    t.string "email"
    t.bigint "merchants_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchants_id"], name: "index_businesses_on_merchants_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_clients_on_address_id"
  end

  create_table "deliverymen", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.bigint "address_id", null: false
    t.bigint "vehicle_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_deliverymen_on_address_id"
    t.index ["user_id"], name: "index_deliverymen_on_user_id"
    t.index ["vehicle_id"], name: "index_deliverymen_on_vehicle_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "cnpj"
    t.string "phone"
    t.string "role"
    t.bigint "address_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_managers_on_address_id"
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "cnpj"
    t.string "phone"
    t.bigint "address_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_merchants_on_address_id"
    t.index ["user_id"], name: "index_merchants_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "key"
    t.text "description"
    t.boolean "delivered"
    t.bigint "clients_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["clients_id"], name: "index_orders_on_clients_id"
  end

  create_table "shippings", force: :cascade do |t|
    t.string "identifier"
    t.string "status"
    t.bigint "deliverymen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "business_id", null: false
    t.index ["business_id"], name: "index_shippings_on_business_id"
    t.index ["deliverymen_id"], name: "index_shippings_on_deliverymen_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "uf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "model"
    t.string "license_plate"
    t.string "color"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "businesses", "merchants", column: "merchants_id"
  add_foreign_key "cities", "states"
  add_foreign_key "clients", "addresses"
  add_foreign_key "deliverymen", "addresses"
  add_foreign_key "deliverymen", "users"
  add_foreign_key "deliverymen", "vehicles"
  add_foreign_key "managers", "addresses"
  add_foreign_key "managers", "users"
  add_foreign_key "merchants", "addresses"
  add_foreign_key "merchants", "users"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "clients", column: "clients_id"
  add_foreign_key "shippings", "businesses"
  add_foreign_key "shippings", "deliverymen", column: "deliverymen_id"
end
