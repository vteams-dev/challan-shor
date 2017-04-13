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

ActiveRecord::Schema.define(version: 20170412075925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string   "device_token"
    t.string   "device_type"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "mark_dangers", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.integer  "mark_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_locations", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "pin"
    t.boolean  "verified"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "uuid"
    t.datetime "expires_at"
    t.string   "f_name"
    t.string   "l_name"
    t.string   "email"
    t.float    "distance",     default: 20.0
    t.boolean  "notification", default: true
  end

end
