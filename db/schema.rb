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

ActiveRecord::Schema.define(version: 2019_09_05_110319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "meeting_place"
    t.date "date"
    t.string "drop_place"
    t.integer "total_price"
    t.string "status", default: "Pending"
    t.bigint "user_id"
    t.bigint "travel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "recipient"
    t.index ["travel_id"], name: "index_bookings_on_travel_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.string "drop_place"
    t.integer "total_price"
    t.string "status", default: "Pending"
    t.bigint "user_id"
    t.bigint "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_orders_on_purchase_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "product_url"
    t.string "name"
    t.string "photo"
    t.string "purchase_place"
    t.string "seller"
    t.integer "price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "delivery_place"
    t.integer "bonus_traveler"
    t.string "status", default: "Pending"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "travels", force: :cascade do |t|
    t.date "departure_date"
    t.date "arrival_date"
    t.time "arrival_hour"
    t.string "arrival_place"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.string "pick_up_place"
    t.text "details"
    t.string "departure_place"
    t.integer "weight_left"
    t.index ["user_id"], name: "index_travels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "address"
    t.string "nationality"
    t.string "telephone"
    t.string "whatsapp_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "travels"
  add_foreign_key "bookings", "users"
  add_foreign_key "orders", "purchases"
  add_foreign_key "orders", "users"
  add_foreign_key "purchases", "users"
  add_foreign_key "travels", "users"
end
