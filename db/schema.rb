# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160915203159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_trips", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "trip_id",     null: false
  end

  add_index "categories_trips", ["category_id", "trip_id"], name: "index_categories_trips_on_category_id_and_trip_id", using: :btree
  add_index "categories_trips", ["trip_id", "category_id"], name: "index_categories_trips_on_trip_id_and_category_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "orders_trips", id: false, force: :cascade do |t|
    t.integer  "order_id",   null: false
    t.integer  "trip_id",    null: false
    t.string   "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders_trips", ["order_id", "trip_id"], name: "index_orders_trips_on_order_id_and_trip_id", using: :btree
  add_index "orders_trips", ["trip_id", "order_id"], name: "index_orders_trips_on_trip_id_and_order_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "price"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "name"
    t.string   "email"
  end

  add_foreign_key "orders", "users"
end
