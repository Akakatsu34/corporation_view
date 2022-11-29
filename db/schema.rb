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

ActiveRecord::Schema.define(version: 2022_11_29_195436) do

  create_table "bs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "security_code"
    t.integer "year"
    t.bigint "asset"
    t.bigint "net_asset"
    t.bigint "shareholders_equity"
    t.bigint "retained_earning"
    t.bigint "current_liability"
    t.bigint "noncurrent_liability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cfs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "security_code"
    t.integer "year"
    t.bigint "net_cash_provided_by_used_in_operating_activity"
    t.bigint "net_cash_provided_by_used_in_investment_activity"
    t.bigint "net_cash_provided_by_used_in_financing_activity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "corporations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "security_code"
    t.string "company_name"
    t.string "company_name_kana"
    t.string "company_name_en"
    t.string "security_name"
    t.string "address"
    t.string "consolidate"
    t.string "market"
    t.integer "sector_thirty_three_number"
    t.string "sector_thirty_three_name"
    t.integer "sector_seventeen_number"
    t.string "sector_seventeen_name"
    t.string "closing_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "security_code"
    t.integer "year"
    t.bigint "net_sale"
    t.bigint "operating_income"
    t.bigint "ordinary_income"
    t.bigint "profit_loss"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
