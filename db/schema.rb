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

ActiveRecord::Schema[7.0].define(version: 2023_03_28_161631) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "flights"
    t.float "transport"
    t.float "eating_out"
    t.float "entertainment"
    t.float "activities"
    t.float "shopping"
    t.float "emergency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "accommodation"
    t.bigint "event_id"
    t.index ["event_id"], name: "index_budgets_on_event_id"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "description"
    t.string "category"
    t.integer "people"
    t.date "start_date"
    t.date "end_date"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "budget"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.text "description"
    t.text "participants"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.string "category"
    t.index ["event_id"], name: "index_expenses_on_event_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "budgets", "users"
  add_foreign_key "events", "users"
  add_foreign_key "expenses", "events"
  add_foreign_key "expenses", "users"
end
