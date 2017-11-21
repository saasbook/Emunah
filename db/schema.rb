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

ActiveRecord::Schema.define(version: 20171121110432) do

  create_table "families", force: :cascade do |t|
    t.string "family_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "discovery"
    t.string "hobbies"
    t.string "skills"
    t.string "activities"
    t.string "committees"
    t.string "membership"
  end

  create_table "people", force: :cascade do |t|
    t.string "hebrew_name"
    t.date "birthday"
    t.string "home_address"
    t.string "telephone"
    t.string "telephone_type"
    t.string "email_address"
    t.string "employer"
    t.string "occupation"
    t.string "anniversary"
    t.boolean "is_child"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "family_id"
    t.string "allow_contact"
    t.string "first_name"
    t.string "last_name"
    t.index ["family_id"], name: "index_people_on_family_id"
  end

  create_table "submittals", force: :cascade do |t|
    t.integer "family_id"
    t.string "title"
    t.string "notes"
    t.string "access_level"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "family_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "full_name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "salt"
    t.string "encrypted_password"
    t.string "password_digest"
    t.string "role"
    t.date "last_login"
  end

end
