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

ActiveRecord::Schema.define(version: 2022_06_24_113459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collects", force: :cascade do |t|
    t.string "description"
    t.string "status"
    t.bigint "store_id", null: false
    t.bigint "deliverymen_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deliverymen_id"], name: "index_collects_on_deliverymen_id"
    t.index ["store_id"], name: "index_collects_on_store_id"
  end

  create_table "deliverymen", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "phone"
    t.string "client_id"
    t.bigint "user_id"
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
    t.text "description"
    t.string "status"
    t.string "recipient_name"
    t.boolean "paid_out"
    t.float "value"
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "collect_id"
    t.string "formated_address"
    t.float "lat"
    t.float "long"
    t.index ["collect_id"], name: "index_orders_on_collect_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "cnpj"
    t.string "phone"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stores_on_user_id"
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

  add_foreign_key "collects", "deliverymen", column: "deliverymen_id"
  add_foreign_key "collects", "stores"
  add_foreign_key "orders", "collects"
  add_foreign_key "orders", "stores"
end
