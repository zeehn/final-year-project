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

ActiveRecord::Schema[7.0].define(version: 2023_08_03_061418) do
  create_table "admins", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.integer "status", default: 0
    t.float "latitude"
    t.float "longitude"
  end

  create_table "complaints", force: :cascade do |t|
    t.text "message"
    t.integer "maid_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_complaints_on_client_id"
    t.index ["maid_id"], name: "index_complaints_on_maid_id"
  end

  create_table "maids", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.integer "hourly_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.text "about"
    t.integer "status", default: 0
    t.float "latitude"
    t.float "longitude"
  end

  create_table "orders", force: :cascade do |t|
    t.date "schedule_date"
    t.time "time_from"
    t.time "time_to"
    t.text "instructions"
    t.integer "client_id", null: false
    t.integer "maid_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.integer "pay_type"
    t.integer "hourly"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["maid_id"], name: "index_orders_on_maid_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "maid_id", null: false
    t.integer "client_id", null: false
    t.integer "stars"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_reviews_on_client_id"
    t.index ["maid_id"], name: "index_reviews_on_maid_id"
  end

  add_foreign_key "complaints", "clients"
  add_foreign_key "complaints", "maids"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "maids"
  add_foreign_key "reviews", "clients"
  add_foreign_key "reviews", "maids"
end
