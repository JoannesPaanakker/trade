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

ActiveRecord::Schema.define(version: 20180402165920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer "bid_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "userbuy_id"
    t.bigint "stockitem_id"
    t.index ["stockitem_id"], name: "index_bids_on_stockitem_id"
    t.index ["userbuy_id"], name: "index_bids_on_userbuy_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "order_time"
    t.integer "order_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stockitem_id"
    t.bigint "userbuy_id"
    t.bigint "usersell_id"
    t.index ["stockitem_id"], name: "index_orders_on_stockitem_id"
    t.index ["userbuy_id"], name: "index_orders_on_userbuy_id"
    t.index ["usersell_id"], name: "index_orders_on_usersell_id"
  end

  create_table "stockitems", force: :cascade do |t|
    t.string "stock_type"
    t.string "description"
    t.boolean "sold_status"
    t.string "original_code"
    t.integer "sell_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usersell_id"
    t.index ["usersell_id"], name: "index_stockitems_on_usersell_id"
  end

  create_table "userbuys", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usersells", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bids", "stockitems"
  add_foreign_key "bids", "userbuys"
  add_foreign_key "orders", "stockitems"
  add_foreign_key "orders", "userbuys"
  add_foreign_key "orders", "usersells"
  add_foreign_key "stockitems", "usersells"
end
