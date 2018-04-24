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

ActiveRecord::Schema.define(version: 20180418103459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer "bid_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stockitem_id"
    t.bigint "userbuy_id"
    t.index ["stockitem_id"], name: "index_bids_on_stockitem_id"
    t.index ["userbuy_id"], name: "index_bids_on_userbuy_id"
  end

  create_table "catalogitems", force: :cascade do |t|
    t.integer "retail_price"
    t.date "release_date"
    t.string "colour"
    t.string "photo"
    t.string "brand"
    t.string "description"
    t.string "product_code"
    t.string "category", default: "shoe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date "order_time"
    t.integer "order_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stockitem_id"
    t.bigint "bid_id"
    t.bigint "orderstatus_id"
    t.index ["bid_id"], name: "index_orders_on_bid_id"
    t.index ["orderstatus_id"], name: "index_orders_on_orderstatus_id"
    t.index ["stockitem_id"], name: "index_orders_on_stockitem_id"
  end

  create_table "orderstatuses", force: :cascade do |t|
    t.integer "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoesizes", force: :cascade do |t|
    t.string "sizes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
    t.index ["region_id"], name: "index_shoesizes_on_region_id"
  end

  create_table "stockitems", force: :cascade do |t|
    t.boolean "dead_stock", default: true
    t.boolean "sold_status", default: false
    t.integer "internal_size"
    t.integer "sell_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usersell_id"
    t.integer "retail_price"
    t.date "release_date"
    t.string "colour"
    t.string "photo"
    t.bigint "catalogitem_id"
    t.index ["catalogitem_id"], name: "index_stockitems_on_catalogitem_id"
    t.index ["usersell_id"], name: "index_stockitems_on_usersell_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "region_id"
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
    t.string "address1"
    t.string "address2"
    t.string "postalcode"
    t.string "city"
    t.string "country"
    t.string "phonenumber"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["region_id"], name: "index_users_on_region_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bids", "stockitems"
  add_foreign_key "bids", "users", column: "userbuy_id"
  add_foreign_key "orders", "bids"
  add_foreign_key "orders", "orderstatuses"
  add_foreign_key "orders", "stockitems"
  add_foreign_key "shoesizes", "regions"
  add_foreign_key "stockitems", "catalogitems"
  add_foreign_key "stockitems", "users", column: "usersell_id"
  add_foreign_key "users", "regions"
end
