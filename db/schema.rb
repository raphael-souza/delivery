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

ActiveRecord::Schema.define(version: 2022_01_20_110227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "description"
    t.string "number"
    t.string "reference"
    t.string "street"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city"
    t.string "cep", limit: 9
    t.string "district"
    t.bigint "client_id"
    t.bigint "deliveryman_id"
    t.index ["client_id"], name: "index_addresses_on_client_id"
    t.index ["deliveryman_id"], name: "index_addresses_on_deliveryman_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "phone"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "collects", force: :cascade do |t|
    t.string "description"
    t.string "status"
    t.decimal "total_orders"
    t.float "total_value"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_collects_on_client_id"
  end

  create_table "deliverymen", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "phone"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_deliverymen_on_user_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "expired_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "orders", force: :cascade do |t|
    t.string "description"
    t.string "recipient_name"
    t.boolean "paid_aout"
    t.decimal "value"
    t.bigint "address_id", null: false
    t.bigint "collect_id"
    t.bigint "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["collect_id"], name: "index_orders_on_collect_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "clients"
  add_foreign_key "addresses", "deliverymen"
  add_foreign_key "collects", "clients"
  add_foreign_key "deliverymen", "users"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "collects"
end
