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

ActiveRecord::Schema.define(version: 20180416160758) do

  create_table "reservations", force: :cascade do |t|
    t.string   "email"
    t.string   "restaurant_name"
    t.date     "date"
    t.integer  "time"
    t.integer  "number_of_people"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "restaurant_name"
    t.integer  "hours_open"
    t.integer  "hours_closed"
    t.integer  "capacity"
    t.string   "url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "address"
    t.string   "neighbourhood"
    t.string   "price_range"
    t.text     "summary"
    t.string   "restaurant_url"
    t.integer  "user_id"
    t.integer  "min_size"
    t.integer  "max_size"
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "loyalty_points"
    t.string   "first_name"
    t.string   "last_name"
  end

end
