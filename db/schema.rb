# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_08_031244) do

  create_table "portfolios", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.string "company"
    t.integer "account_number"
    t.integer "account_value"
    t.index ["stock_id"], name: "index_portfolios_on_stock_id"
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "stock"
    t.string "ticker_symbol"
    t.integer "price"
    t.integer "quantity"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
  end

  add_foreign_key "portfolios", "stocks"
  add_foreign_key "portfolios", "users"
end
