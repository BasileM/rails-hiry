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

ActiveRecord::Schema.define(version: 2018_06_07_082155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "housings", force: :cascade do |t|
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.string "type_of_housing"
    t.string "legal_regime"
    t.integer "year_of_construction"
    t.integer "floor"
    t.float "size"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_housings_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "room_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_images_on_room_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "rental_id"
    t.bigint "room_id"
    t.string "state"
    t.string "observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_inventories_on_rental_id"
    t.index ["room_id"], name: "index_inventories_on_room_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "monthly_invoice"
    t.date "date"
    t.bigint "rental_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_receipts_on_rental_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "housing_id"
    t.boolean "furnished", default: false
    t.date "start_date"
    t.date "end_date"
    t.integer "monthly_rent"
    t.integer "monthly_expenses"
    t.string "lease_pdf"
    t.string "inventory_pdf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
    t.string "lease_docusign_envelope_id"
    t.boolean "signed_by_owner", default: false
    t.boolean "signed_by_renter", default: false
    t.string "renter_token"
    t.string "uri"
    t.index ["housing_id"], name: "index_rentals_on_housing_id"
  end

  create_table "renters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "nationality"
    t.date "date_of_birth"
    t.string "marital_status"
    t.bigint "rental_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.float "latitude"
    t.float "longitude"
    t.index ["rental_id"], name: "index_renters_on_rental_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "housing_id"
    t.string "type_of_room"
    t.float "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["housing_id"], name: "index_rooms_on_housing_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "first_name"
    t.string "last_name"
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.string "phone_number"
    t.string "nationality"
    t.date "date_of_birth"
    t.string "marital_status"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "housings", "users"
  add_foreign_key "images", "rooms"
  add_foreign_key "inventories", "rentals"
  add_foreign_key "inventories", "rooms"
  add_foreign_key "receipts", "rentals"
  add_foreign_key "rentals", "housings"
  add_foreign_key "renters", "rentals"
  add_foreign_key "rooms", "housings"
end
