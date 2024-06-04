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

ActiveRecord::Schema[7.1].define(version: 2024_06_04_052433) do
  create_table "cards", force: :cascade do |t|
    t.integer "merchant_id", null: false
    t.string "token", null: false
    t.date "expiry", null: false
    t.string "name", null: false
    t.string "brand", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_cards_on_merchant_id"
    t.index ["token"], name: "index_cards_on_token", unique: true
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "enabled_at"
    t.json "currencies_allowed", default: [], null: false
    t.string "api_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_token"], name: "index_merchants_on_api_token", unique: true
    t.check_constraint "JSON_TYPE(currencies_allowed) = 'array'", name: "merchant_currencies_allowed_is_array"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "merchant_id", null: false
    t.integer "card_id", null: false
    t.string "reference", null: false
    t.integer "amount", null: false
    t.string "currency", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_purchases_on_card_id"
    t.index ["merchant_id"], name: "index_purchases_on_merchant_id"
    t.index ["reference"], name: "index_purchases_on_reference", unique: true
  end

  add_foreign_key "cards", "merchants"
  add_foreign_key "purchases", "cards"
  add_foreign_key "purchases", "merchants"
end
