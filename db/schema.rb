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

ActiveRecord::Schema.define(version: 2019_12_13_180308) do

  create_table "car_categories", force: :cascade do |t|
    t.string "name"
    t.decimal "daily_rate"
    t.decimal "car_insurance"
    t.decimal "third_party_insurance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_models", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.string "motorization"
    t.string "fuel_type"
    t.integer "manufacturer_id"
    t.integer "car_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_category_id"], name: "index_car_models_on_car_category_id"
    t.index ["manufacturer_id"], name: "index_car_models_on_manufacturer_id"
  end

  create_table "car_rentals", force: :cascade do |t|
    t.integer "car_id"
    t.integer "rental_id"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_rentals_on_car_id"
    t.index ["rental_id"], name: "index_car_rentals_on_rental_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "license_plate"
    t.string "color"
    t.integer "mileage"
    t.integer "car_model_id"
    t.integer "subsidiary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
    t.index ["subsidiary_id"], name: "index_cars_on_subsidiary_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "client_id"
    t.integer "car_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reservation_code"
    t.integer "status"
    t.integer "subsidiary_id"
    t.index ["car_category_id"], name: "index_rentals_on_car_category_id"
    t.index ["client_id"], name: "index_rentals_on_client_id"
    t.index ["subsidiary_id"], name: "index_rentals_on_subsidiary_id"
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
