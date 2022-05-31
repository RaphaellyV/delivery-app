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

ActiveRecord::Schema[7.0].define(version: 2022_05_30_195009) do
  create_table "companies", force: :cascade do |t|
    t.string "brand_name"
    t.string "corporate_name"
    t.string "domain"
    t.string "registration_number"
    t.string "postal_code"
    t.string "billing_address"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deadlines", force: :cascade do |t|
    t.integer "min_distance"
    t.integer "max_distance"
    t.integer "max_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_deadlines_on_company_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "recipient_name"
    t.string "recipient_registration_number"
    t.string "recipient_telephone"
    t.string "recipient_email"
    t.string "recipient_address"
    t.string "recipient_postal_code"
    t.string "recipient_city"
    t.string "recipient_state"
    t.string "product_code"
    t.integer "product_length"
    t.integer "product_height"
    t.integer "product_width"
    t.integer "product_weight"
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tracking_code"
    t.index ["company_id"], name: "index_orders_on_company_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "min_vol"
    t.decimal "max_vol"
    t.decimal "min_weight"
    t.decimal "max_weight"
    t.decimal "price_per_km"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "license_plate"
    t.string "v_brand"
    t.string "v_model"
    t.integer "v_year"
    t.integer "max_load"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "deadlines", "companies"
  add_foreign_key "orders", "companies"
  add_foreign_key "users", "companies"
end
