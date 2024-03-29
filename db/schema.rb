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

ActiveRecord::Schema.define(version: 2018_07_07_151745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.decimal "pet", null: false
    t.string "name"
    t.string "description", null: false
    t.string "prevalent_color", null: false
    t.decimal "size", null: false
    t.string "race"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "phone"
    t.string "email", null: false
    t.string "password_digest"
  end

  add_foreign_key "announcements", "users"
end
